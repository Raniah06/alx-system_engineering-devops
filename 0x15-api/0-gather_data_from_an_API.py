#!/usr/bin/python3
"""
Write a Python script that, using this REST API, for a given employee ID, returns information about his/her TODO list progress.
"""
import requests
import sys

if __name__ == "__main__":
    eid = sys.argv[1]
    name = requests.get("http://jsonplaceholder.typicode.com/users/{}"
                        .format(eid)).json().get("name")
    total_tasks = 0
    done_tasks = []
    r = requests.get("http://jsonplaceholder.typicode.com/todos").json()

    for task in r:
        if (task.get("userId") == int(eid)):
            total_tasks += 1
            if (task.get("completed")):
                done_tasks.append(task.get("title"))

    print("Employee {} is done with tasks({:d}/{:d}):"
          .format(name, len(done_tasks), total_tasks))

    for item in done_tasks:
        print("\t {}".format(item))
