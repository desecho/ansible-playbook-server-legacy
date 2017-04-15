#!/bin/bash

cd {{ home }}/blog
rake new_post["$1"]
