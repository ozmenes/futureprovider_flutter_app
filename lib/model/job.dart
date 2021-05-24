class MyJobModel{
  String jobIs="not Finished.";
  MyJobModel({required this.jobIs});

  Future<void> doJobIsDone() async {
    await Future.delayed(Duration(seconds: 2));
    jobIs = "Finished.";
    print(jobIs);
  }
}