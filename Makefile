.PHONY: all deploy clean

all: target target/index.html

target:
	git worktree add target gh-pages

target/index.html: appetizers breads coffees desserts meals
	./build.sh

deploy: all
	cd target && \
	git add --all && \
	git commit -m "Deploy to gh-pages $(git log '--format=format:%H' master -1)" && \
	echo "git push origin gh-pages"

clean:
	rm -rf target/*
