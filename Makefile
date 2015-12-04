# docker-nomad makefile

CONTAINER = nomad
CLUSTER ?= {cluster_name}

ENVS = -e CLUSTER=$(CLUSTER)

include ../wot-make/docker.mk
