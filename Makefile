TOPO=topo.yml

PREFIX=lab_

LEAF-1=$(PREFIX)Leaf-1
LEAF-2=$(PREFIX)Leaf-2
LEAF-3=$(PREFIX)Leaf-3

SPINE-1=$(PREFIX)Spine-1
SPINE-2=$(PREFIX)Spine-2

HOST-1=$(PREFIX)Host-1
HOST-2=$(PREFIX)Host-2
HOST-3=$(PREFIX)Host-3

LEAF=$(LEAF-1) $(LEAF-2) $(LEAF-3)

SPINE=$(SPINE-1) $(SPINE-2)

HOST=$(HOST-1) $(HOST-2) $(HOST-3)

NET=$(PREFIX)net-0

EXEC=docker exec -it

SHELL=/bin/sh

create:
	docker-topo --create $(TOPO)

destroy:
	docker-topo --destroy $(TOPO)

ps:
	docker ps | grep $(PREFIX)

stats:
	docker stats --no-stream $(LEAF) $(SPINE) $(HOST)

net:
	docker network inspect $(NET)

l1:
	$(EXEC) $(LEAF-1) Cli

l2:
	$(EXEC) $(LEAF-2) Cli

l3:
	$(EXEC) $(LEAF-3) Cli

s1:
	$(EXEC) $(SPINE-1) Cli

s2:
	$(EXEC) $(SPINE-2) Cli

h1:
	$(EXEC) $(HOST-1) $(SHELL)

h2:
	$(EXEC) $(HOST-2) $(SHELL)

h3:
	$(EXEC) $(HOST-3) $(SHELL)
