import ast
import os


def check_docstrings(filename):
    """checks the file for docstring"""
    with open(filename, "r") as source:
        tree = ast.parse(source.read())
        if not ast.get_docstring(tree):
            print(f"Module {filename} is missing a docstring.")
        for node in ast.walk(tree):
            if isinstance(node, (ast.FunctionDef, ast.AsyncFunctionDef, ast.ClassDef)) and not ast.get_docstring(node):
                print(
                    f"{node.__class__.__name__} {node.name} in file {filename} is missing a docstring.")


for filename in os.listdir('.'):
    if filename.endswith('.py'):
        check_docstrings(filename)
