# Understanding Helm Components


## 1. Helm Charts

A **Helm chart** is a collection of files that describe a set of Kubernetes resources. It acts as a **package** for your Kubernetes application, similar to a **DEB** or **RPM** file in Linux.

### **Components of a Chart:**

* **Chart.yaml:** Metadata about the chart (name, version, etc.).
* **values.yaml:** Default configuration values.
* **templates/**: Directory containing Kubernetes manifests as templates.
* **charts/**: Directory for chart dependencies.
* **README.md:** Optional documentation.

### **Creating a Chart:**

```bash
helm create myapp
```

This generates a new chart structure under the `myapp` directory.

### **Installing a Chart:**

```bash
helm install my-nginx bitnami/nginx
```

Charts enable you to define complex applications, including deployments, services, config maps, and more, all bundled together for easy management.

---

## 2. Helm Repositories

A **Helm repository** is a place where Helm charts are stored and shared. It’s similar to a **package repository** in Linux (like APT or YUM repos).

### **Adding a Repository:**

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

### **Listing Repositories:**

```bash
helm repo list
```

### **Updating Repositories:**

```bash
helm repo update
```

Repositories make it easy to organize, store, and distribute Helm charts, and they support versioning, so you can choose specific versions of a chart to install.

---

## 3. Helm Releases

A **Helm release** is a specific instance of a chart that has been deployed to your Kubernetes cluster. You can think of it as a **deployed version of your application.**

### **Creating a Release:**

```bash
helm install myapp ./myapp
```

### **Listing Releases:**

```bash
helm list
```

### **Upgrading a Release:**

```bash
helm upgrade myapp ./myapp
```

### **Rolling Back a Release:**

```bash
helm rollback myapp 1
```

### **Deleting a Release:**

```bash
helm uninstall myapp
```

Releases are useful for tracking deployed versions, performing rollbacks in case of failures, and managing multiple instances of the same chart.

---

## Summary

* **Charts** are packages that define Kubernetes resources.
* **Repositories** are storage locations for Helm charts.
* **Releases** are deployed instances of a chart.
