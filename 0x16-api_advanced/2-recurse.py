#!/usr/bin/python3
import requests

def recurse(subreddit, hot_list=[], after=None):
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-Agent': 'Mozilla/5.0'}
    params = {'after': after}
    response = requests.get(url, headers=headers, params=params, allow_redirects=False)

    if response.status_code != 200:
        return None if not hot_list else hot_list

    data = response.json().get('data', {})
    after = data.get('after')
    hot_list.extend([item.get('data', {}).get('title') for item in data.get('children', [])])

    if after is None:
        return hot_list
    else:
        return recurse(subreddit, hot_list, after)

