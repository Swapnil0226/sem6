class Node:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

def bfs_traversal(root):
    if root is None:
        return
    queue = []
    queue.append(root)
    while queue:
        print("Fringe:", [node.val for node in queue[::-1]])
        current_node = queue.pop(0)
        print("Visited:", current_node.val)
        if current_node.left:
            queue.append(current_node.left)
        if current_node.right:
            queue.append(current_node.right)
    print("Fringe: []")

root = Node("A")
root.left = Node("B")
root.right = Node("C")
root.left.left = Node("D")
root.left.right = Node("E")
root.right.left = Node("F")
root.right.right = Node("G")

bfs_traversal(root)