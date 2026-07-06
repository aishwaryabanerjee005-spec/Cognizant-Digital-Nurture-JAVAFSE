public class TestSearch
{
    public static void main(String[] args)
    {
        Product[] products =
        {
            new Product(101,"Laptop","Electronics"),
            new Product(102,"Phone","Electronics"),
            new Product(103,"Shoes","Fashion"),
            new Product(104,"Watch","Accessories"),
            new Product(105,"Book","Education")
        };

        Product result1 = SearchAlgorithms.linearSearch(products,103);

        if(result1 != null)
        {
            System.out.println("Linear Search Found:");
            result1.display();
        }

        Product result2 = SearchAlgorithms.binarySearch(products,104);

        if(result2 != null)
        {
            System.out.println("Binary Search Found:");
            result2.display();
        }
    }
}