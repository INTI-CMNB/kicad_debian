#!/usr/bin/python3
from datetime import datetime, timezone
import requests
import sys


ORG = 'INTI-CMNB'
PKGS = {'base_os', 'base_os_full', 'kicad7_debian'}
PKG = 'base_os'
HEADER = {'Accept': 'application/vnd.github+json',
          'Authorization': 'Bearer '+sys.argv[1],
          'X-GitHub-Api-Version': '2022-11-28'}


def erase(name):
    url = f'https://api.github.com/orgs/{ORG}/packages/container/{PKG}/versions/{name}'
    r = requests.delete(url, timeout=20, allow_redirects=True, headers=HEADER)
    assert r.status_code == 204, r.status_code


deleted = 0
for PKG in PKGS:
    url = f'https://api.github.com/orgs/{ORG}/packages/container/{PKG}/versions'
    page = 1
    received = 100
    vers = []
    while received == 100:
        r = requests.get(url, timeout=20, allow_redirects=True, headers=HEADER, params={'per_page': 100, 'page': page})
        assert r.status_code == 200
        page = page+1
        res = r.json()
        vers.extend(res)
        received = len(res)
    
    now = datetime.now(timezone.utc)
    for v in vers:
        # How old is this version?
        date_str = v["updated_at"]
        parsed_date = datetime.fromisoformat(date_str.replace('Z', '+00:00'))
        days_ago = (now - parsed_date).days
        # Leave anything with 15 or less days
        if days_ago < 15:
            continue
        # Analyze the tags
        tags = v["metadata"]["container"]["tags"]
        if len(tags) == 0:
            print(f"Deleting {v['html_url']} UNTAGGED {days_ago} days ago")
            erase(v["id"])
            deleted += 1
print(f"Deleted {deleted} versions")
