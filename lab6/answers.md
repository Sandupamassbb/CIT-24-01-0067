


## Checkpoint Q1

**Explain the difference between the control plane and a worker node.**

The **control plane** manages the Kubernetes cluster. It schedules pods, monitors the cluster, and makes decisions. The **worker node** runs the application pods and containers. The control plane manages the cluster, while the worker node does the actual work.

---

## Checkpoint Q2

**Did the Pod IP change after deleting and recreating the pod? Why?**

Yes. The Pod IP changed after deleting and recreating the pod. Pods are **ephemeral**, which means they are temporary. When a pod is deleted, Kubernetes creates a new pod with a new IP address.

---

## Checkpoint Q3

**What happened when the pod was deleted?**

1. I deleted the frontend pod.
2. Kubernetes detected that the pod was missing.
3. The Deployment controller compared the desired state with the actual state.
4. It found that one pod was missing.
5. Kubernetes automatically created a new pod.
6. The new pod started and reached the Running state.

---

## Checkpoint Q4

**Why can the frontend be scaled without affecting the database?**

Each application tier is deployed separately. The frontend, API, cache, and database are independent. Therefore, the frontend can be scaled without changing the database because they have different controllers and resources.

---

## Checkpoint Q5

**What is the difference between port-forward and a Service?**

**Port-forward** gives temporary access to a single pod for testing. If the pod is deleted, the connection is lost.

A **Service** provides a stable IP address and DNS name. Even if pods are replaced and their IP addresses change, the Service still connects users to the correct pod.

---

## Checkpoint Q6

**Why is update and rollback harder in Docker Compose?**

Docker Compose does not automatically manage rolling updates or rollbacks. If an update fails, it usually needs manual changes and restarting containers. Kubernetes provides built-in rolling updates and rollback, making updates safer and easier.

---

## Checkpoint Q7

**Why do the frontend and API use Deployments while PostgreSQL uses a StatefulSet?**

The frontend and API are **stateless**, so Deployments are suitable because pod names and IP addresses can change.

PostgreSQL is **stateful**, so it uses a StatefulSet because it needs:

* Stable pod names
* Persistent storage
* Ordered creation and deletion of pods

This helps keep the database data safe.

---

## Checkpoint Q8

**Would the data survive without a PersistentVolumeClaim?**

No. If PostgreSQL was deployed as a normal Deployment without a PersistentVolumeClaim, the data would be lost when the pod was deleted. The PersistentVolumeClaim stores the data even after the pod is recreated.

---

## Checkpoint Q9

**What status did the broken pod show? Explain.**

The broken pod showed the **ImagePullBackOff** status. This is related to the pod not being able to download the container image because the image name was incorrect. It is not one of the main statuses shown in the lecture table, but it is a related error status. The pod cannot start until the correct image is provided.

---

