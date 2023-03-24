PROJECT        = gitops
ENV            = demo
SERVICE        = app
DOCKERHUB_USER = punkerside

build:
	docker build -t ${DOCKERHUB_USER}/${PROJECT}-${ENV}-${SERVICE}:latest .

release:
	echo ${DOCKERHUB_PASS} | docker login --username ${DOCKERHUB_USER} --password-stdin
	docker tag ${DOCKERHUB_USER}/${PROJECT}-${ENV}-${SERVICE}:latest ${DOCKERHUB_USER}/${PROJECT}-${ENV}-${SERVICE}:${GITHUB_RUN_ID}
	docker push ${DOCKERHUB_USER}/${PROJECT}-${ENV}-${SERVICE}:latest
	docker push ${DOCKERHUB_USER}/${PROJECT}-${ENV}-${SERVICE}:${GITHUB_RUN_ID}