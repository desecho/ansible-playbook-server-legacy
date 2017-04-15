#!/bin/bash

cd {{ home }}/blog
rake generate
rake preview
