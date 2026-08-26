{
  lib,
  python3Packages,
  fetchurl,
}:

python3Packages.buildPythonPackage rec {
  pname = "tavily-python";
  version = "0.7.27";
  pyproject = true;

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/92/53/e97950453a215a7b8c2c44d70b216f64c0e1d9844d8b91f025104e96d233/tavily_python-${version}.tar.gz";
    hash = "sha256-P7vuf8fiUkebJkg15vlDtKgTlUKcG9QZ6AJNEb8sGDE=";
  };

  build-system = with python3Packages; [ setuptools ];

  dependencies = with python3Packages; [
    httpx
    requests
    tiktoken
  ];

  doCheck = false;

  pythonImportsCheck = [ "tavily" ];

  meta = {
    description = "Python wrapper for the Tavily API";
    homepage = "https://github.com/tavily-ai/tavily-python";
    license = lib.licenses.mit;
  };
}
