enum WorkerRole {
  owner,
  employee,
  undefined,
}

String workerRoleToString(WorkerRole role) {
  return role.toString().split('.').last;
}

WorkerRole workerRoleFromString(String roleString) {
  return WorkerRole.values.firstWhere((role) => workerRoleToString(role) == roleString);
}
