docker build -t sariroti/docker-react-multicontainer-client:latest ./client/Dockerfile ./client
docker build -t sariroti/docker-react-multicontainer-server:latest ./server/Dockerfile ./server
docker build -t sariroti/docker-react-multicontainer-worker:latest ./worker/Dockerfile ./worker
docker push sariroti/docker-react-multicontainer-client:latest
docker push sariroti/docker-react-multicontainer-server:latest
docker push sariroti/docker-react-multicontainer-worker:latest


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sariroti/docker-react-multicontainer-server:latest
kubectl set image deployments/client-deployment client=sariroti/docker-react-multicontainer-client:latest
kubectl set image deployments/worker-deployment worker=sariroti/docker-react-multicontainer-worker:latest
