import java.lang.reflect.Array;
import java.util.ArrayList;

/*
 * Done by: Asher Andargachew
 * Student ID: 501101885
*/

/* A shoe is a product that has additional information - e.g. size, color

 	 A shoe comes in different sizes (6, 7, 8, 9, 10)
 	 
 	 The color is specified as a specific "stock type" in get/set/reduce stockCount methods.

*/
public class Shoe extends Product {
    // shoe specific variables
    private String size;
    private String color;

    // color and size stock
    int[] shoeStock = new int[10];

    public Shoe(String name, String id, double price, int shoeStock) {
        // Make use of the constructor in the super class Product. Initialize additional
        // Shoe instance variables.
        // Set category to SHOES
        super(id);
        super.setPrice(price);
        super.setName(name);
        for (int i = 0; i < this.shoeStock.length; i++) {
            this.shoeStock[i] = shoeStock;
        }
        super.setCategory(Category.CLOTHING);
    }

    // Check if a valid color
    public boolean validOptions(String productOptions) {
        // check productOptions for color or size
        // if it is one of these, return true, else return false
        size = productOptions.split(" ")[0];
        color = productOptions.split(" ")[1];

        if (size.equals("6") || size.equals("7") || size.equals("8")
                || size.equals("9") || size.equals("10")) {
            if (color.equalsIgnoreCase("Black") || color.equalsIgnoreCase("Brown")) {
                return true;
            }
        }

        return false;
    }

    // Override getStockCount() in super class.
    @Override
    public int getStockCount(String productOptions) {
        // Use the productOptions to check for (and return) the number of stock for
        // "6 Black" or " 6 Brown"
        // Use the variables color, size, and shoeStock at the top.
        // get substring of product to check if it's a shoe size
        size = productOptions.split(" ")[0];
        color = productOptions.split(" ")[1];

        if (size.equals("6")) {
            if (color.equalsIgnoreCase("Black")) {
                return shoeStock[0];
            } else if (color.equalsIgnoreCase("Brown")) {
                return shoeStock[1];
            }
        } else if (size.equals("7")) {
            if (color.equalsIgnoreCase("Black")) {
                return shoeStock[2];
            } else if (color.equalsIgnoreCase("Brown")) {
                return shoeStock[3];
            }
        } else if (size.equals("8")) {
            if (color.equalsIgnoreCase("Black")) {
                return shoeStock[4];
            } else if (color.equalsIgnoreCase("Brown")) {
                return shoeStock[5];
            }
        } else if (size.equals("9")) {
            if (color.equalsIgnoreCase("Black")) {
                return shoeStock[6];
            } else if (color.equalsIgnoreCase("Brown")) {
                return shoeStock[7];
            }
        } else if (size.equals("10")) {
            if (color.equalsIgnoreCase("Black")) {
                return shoeStock[8];
            } else if (color.equalsIgnoreCase("Brown")) {
                return shoeStock[9];
            }
        }
        return 0;
    }

    public void setStockCount(int stockCount, String productOptions) {
        // Use the productOptions to check for (and set) the number of stock for
        // color and size
        // Use the variables color, size, and shoeStock at the top.
        size = productOptions.split(" ")[0];
        color = productOptions.split(" ")[1];

        if (size.equals("6")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[0] = stockCount;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[1] = stockCount;
            }
        } else if (size.equals("7")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[2] = stockCount;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[3] = stockCount;
            }
        } else if (size.equals("8")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[4] = stockCount;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[5] = stockCount;
            }
        } else if (size.equals("9")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[6] = stockCount;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[7] = stockCount;
            }
        } else if (size.equals("10")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[8] = stockCount;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[9] = stockCount;
            }
        }
    }

    /*
     * When a shoe is ordered, reduce the stock count for the specific color stock
     * type
     */
    public void reduceStockCount(String productOptions) {
        // Use the productOptions to check for (and reduce) the number of stock for
        // "6 Black" or "6 Brown"
        // Use the variables color, size, and shoeStock at the top.
        size = productOptions.split(" ")[0];
        color = productOptions.split(" ")[1];

        if (size.equals("6")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[0]--;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[1]--;
            }
        } else if (size.equals("7")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[2]--;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[3]--;
            }
        } else if (size.equals("8")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[4]--;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[5]--;
            }
        } else if (size.equals("9")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[6]--;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[7]--;
            }
        } else if (size.equals("10")) {
            if (color.equalsIgnoreCase("Black")) {
                shoeStock[8]--;
            } else if (color.equalsIgnoreCase("Brown")) {
                shoeStock[9]--;
            }
        }
    }

    /*
     * Print product information in super class and append Shoe specific information
     * size and color
     */
    public void print() {
        // Make use of the super class print() method
        super.print();
    }
}
