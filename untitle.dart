class Name {
  String sk;
  int age;

  Name(this.sk, this.age);

  void dd() {
    print("name: $sk , age: $age");
  }
}

void main() {
  Name names = Name("sujith", 27);
  names.dd();
}
