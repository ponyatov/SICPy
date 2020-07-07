.PHONY: wiki
wiki:
	git pull -v
	$(MAKE) -C $@ $@
	git add -f wiki/*
	cd $@ ; git push -v
	git push -v
