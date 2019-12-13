TOPO=topo.yml

PREFIX=lab_

LEAF=$(PREFIX)Leaf-1 $(PREFIX)Leaf-2 $(PREFIX)Leaf-3

SPINE=$(PREFIX)Spine-1 $(PREFIX)Spine-2

HOST=$(PREFIX)Host-1 $(PREFIX)Host-2 $(PREFIX)Host-3

create:
	docker-topo --create $(TOPO)

destroy:
	docker-topo --destroy $(TOPO)

ps:
	docker ps | grep $(PREFIX)

stats:
	docker stats --no-stream $(LEAF) $(SPINE) $(HOST)
