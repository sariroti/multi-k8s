docker build -t sariroti/docker-react-multicontainer-client:latest -t sariroti/docker-react-multicontainer-client:$SHA ./client/Dockerfile ./client
docker build -t sariroti/docker-react-multicontainer-server:latest -t sariroti/docker-react-multicontainer-server:$SHA  ./server/Dockerfile ./server
docker build -t sariroti/docker-react-multicontainer-worker:latest -t sariroti/docker-react-multicontainer-worker:$SHA ./worker/Dockerfile ./worker
docker push sariroti/docker-react-multicontainer-client:latest
docker push sariroti/docker-react-multicontainer-server:latest
docker push sariroti/docker-react-multicontainer-worker:latest
docker push sariroti/docker-react-multicontainer-client:$SHA
docker push sariroti/docker-react-multicontainer-server:$SHA
docker push sariroti/docker-react-multicontainer-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sariroti/docker-react-multicontainer-server:$SHA
kubectl set image deployments/client-deployment server=sariroti/docker-react-multicontainer-client:$SHA
kubectl set image deployments/worker-deployment server=sariroti/docker-react-multicontainer-worker:$SHA
