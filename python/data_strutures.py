


class DataStructures:
    """
    Explore python data structures - Lists, Tuples, Dictionary, Sets, Arrays
    """

    def __init__(self): # instance level 
        self.example_list = [1,2,3,4]

    def list_operations(self):
        """
        List operations: append, remove, pop, and slicing
        """

        print("\n--- List Operations ---")
        print(f"Initial list: {self.example_list}")

        # Append operation
        self.example_list.append(5)
        print(f"List after append(5): {self.example_list}")





if __name__ == "__main__":

    # create an instance of the class DataStructures
    data_structures = DataStructures()

    # perform list operations
    data_structures.list_operations()


