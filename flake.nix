{
  description = "Flutter + Rust Devenv Template";

  outputs = { self, ... }: {
    templates.default = {
      path = ./.;
      description = "Flutter + Rust + Android Devenv setup";
    };
  };
}
