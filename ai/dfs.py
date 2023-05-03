class Node:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

def dfs_traversal(node):
    if node is None:
        return
    stack = []
    stack.append(node)
    while stack:
        current_node = stack.pop()
        print("Visited:", current_node.val)
        if current_node.right:
            stack.append(current_node.right)
        if current_node.left:
            stack.append(current_node.left)
        print("Fringe:", [node.val for node in stack])

# Create a tree
root = Node("A")
root.left = Node("B")
root.right = Node("C")
root.left.left = Node("D")
root.left.right = Node("E")
root.right.left = Node("F")
root.right.right = Node("G")

dfs_traversal(root)