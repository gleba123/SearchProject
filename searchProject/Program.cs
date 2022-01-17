using System;
using seacrhLogic; //connection with the DLL 


namespace searchProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Class1 userSearch = new Class1(); // the UI object, with thst object we can get the prop's and the method's from the DLL.
            userSearch.ClientSearchEvent += SearchResult;//Registration of the event to the event function - function that approve the search.
            userSearch.SearchErrorEvent += ErrorFuncOfSearch;//Registration of the event to the event function - function that send's us the Error msg.
            string choice;//client prop that hold client choice in the switch choice
            string fileName;//prop that hold client's file name.
            do//do & while loop - if the client didnt choose the ending loop cindition it will run over and over again
            {
                Console.WriteLine("welcome to our File Search Project!");
                Console.WriteLine("please enter:");
                Console.WriteLine("1- Search with file name:");
                Console.WriteLine("2- Search with File name + Path:");
                Console.WriteLine("3- EXIT");
                choice = Console.ReadLine();
                try//try condition that will cheack if there is any problem with the entering data of the client
                {
                    if (choice != "1" && choice != "2" && choice != "3")//client option's
                    {
                        throw new Exception(); // throw's exeption - if the client choose wrong choice.
                    }
                    switch (choice)
                    {
                        case "1":
                            Console.WriteLine("please enter File name:");
                            fileName = Console.ReadLine();
                            userSearch.MainSearch(fileName, "c:\\");//send to the func the file name with defualt path to search for.
                            break;
                        case "2":
                            Console.WriteLine("please enter path:");//case 2 - very similar to case 1 but the different is that the client send's us the spacific path to search for.
                            string path = Console.ReadLine();
                            Console.WriteLine("please enter file name:");
                            fileName = Console.ReadLine();
                            userSearch.MainSearch(fileName,path);//send to the func the file name with defualt path to search for.

                            break;
                    }

                }
                catch (Exception ex)
                {
                    Console.WriteLine("ERROR - " + ex.Message);//the msg exeption if the client press wrong option.
                }


            } while (choice != "3");//the exit condition.

        }
        static void SearchResult(string ResultFileAfterSearch)//function that approve the search - connected to the event
        {
                Console.WriteLine("The file is:" + ResultFileAfterSearch);
            }

        static void ErrorFuncOfSearch(string SearchError)//function that send's us the Error msg - connected to the event.
        {
            Console.WriteLine("ERROR! , The file " + SearchError + " didnt found"); 
        }

    }




}

