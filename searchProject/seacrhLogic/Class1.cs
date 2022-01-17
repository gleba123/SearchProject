using System;
using System.IO;//using that give us the search directory + files directory in this case.
using System.Data.SqlClient;//using for the sqlConnection + command + sqlDataReader
using System.Collections.Generic;//using that gives us the oprion to work with the list's function & list array's.

namespace seacrhLogic
{
    public delegate void SearchHendler(string ResultMsg);//delegate diclaration - part of the event
    public delegate void ErrorHendler(string ErrorMsg);//delegate diclaration - part of the event
    public class Class1
    {
        public event SearchHendler ClientSearchEvent;//event decleretion - when the search is ok its start the event func.
        public event ErrorHendler SearchErrorEvent;//event decleretion - when the search is wrong its start the event func.
        public string choice { get; set; } //client selection prop
        public string fileName { get; set; }//client file name that enter into the program prop


        public static List<string> searchList = new List<string>();//list that hold all the data that gets from the search

        public void MainSearch(string fileToSearchFor, string PathToSearch)// main fun - gets 2 prop that go to the next function of the seacrh + send's the info into the DB and clear after all the list for the next search
        {
            SearchFileFunc(fileToSearchFor, PathToSearch);//secound fun - the func that hold all the logic of the recursion
            DbConnection(fileToSearchFor, PathToSearch);//func of the DB this func is send all the info to the db
            searchList.Clear();//clear the list for the next search
        }
        private void SearchFileFunc(string fileName, string pathSearch)//logic func to the recursion hold all the directory data + file data.
        {
            try
            {
                string[] directories;
                directories = Directory.GetDirectories(pathSearch,"*",SearchOption.TopDirectoryOnly);//arry that hold all the direction's
                string[] files;
                files = Directory.GetFiles(pathSearch, "*" + fileName + "*", SearchOption.TopDirectoryOnly);//array that hold all the file's
                foreach (string dir in directories)//foreach loof that go inside the direction's , when there is no such file and there is another dir with that loop we go into the recursion that we done inside the loop
                {
                    SearchFileFunc(fileName, dir);//the recursion - we always get the file name that send's from the client, and if it was choice num 2 we get also the path and in every time we go depper and depper to find the matched file's
                }
                foreach (string file in files) //loop that find our direct files in the file's array
                {
            
                        ClientSearchEvent?.Invoke(file);//start of the event - send's the name of the full path to the event func!
                        searchList.Add(file);//the name of the full path + file go inside the list

                }
            }
            catch (Exception)//exeption that is empty, if we do get exeption it will bring us alot of denied answers becouse tamplate C is blocked in many cases
            {

            }

        }
        void DbConnection(string filename, string pathName) // func that hold all the info of the DB
        {
            int MaxValOfDb=0;//prop that will hold our last & the bigger index of the searchID only with that index we can compare the PK & FK.
            try
            {
                SqlConnection DbCon = new SqlConnection("Data Source=LAPTOP-8E9NLPHH\\SQLEXPRESS;Initial Catalog=dbSearchProject;Integrated Security=True");//DB connection
                SqlDataReader dr;//data reader that bring us back not only one prop but a serial of prop's.
                SqlCommand DbCom1 = new SqlCommand($"insert into ClientSearchFile (fileName,filePath) values('{filename}','{pathName}')", DbCon);//insert to the clientSearchFile table all the info the client is entered
                DbCon.Open();//start of the connection
                DbCom1.ExecuteNonQuery();//execute the data to db in the end
                DbCon.Close();//close the connection

                SqlCommand DbCom2 = new SqlCommand($"select MAX (searchID) from ClientSearchFile ", DbCon);//like it was writen above we search for the bigger index in searchID to compare and insert it to the ResultSearchFile table to compare the FK & PK
                DbCon.Open();//start of the connection
                dr = DbCom2.ExecuteReader();//execute a serial of prop's becouse there is many searche's and we need only the last one to enter it to DB , we will see it in the while loop after it.
                while (dr.Read())//while loop that bring's us all the info from the reader if there is any info
                {
                    MaxValOfDb = Convert.ToInt32(dr[0]);//if there is info we get back the indexer's number's, we get only the biggest one and he will be in the index num 0!
                }
                DbCon.Close();//close the connection


                if (searchList.Count!=0)//condition that if there is no data in our list it will bring us back an error msg, if there is data he wiil enter and in the end of the search enter all the data to the result table
                {
                    foreach (string search in searchList)//foreach loop that go all over the list data and bring it inside to the prop "search".
                    {
                        SqlCommand Dbcom3 = new SqlCommand($"insert ResultSearchFile (FileAndPath,searchID) values('" + search +"','"+ MaxValOfDb +"')", DbCon);//command that insert all the data to the result data + with that insert we enter the compared PK & FK of the search.
                        DbCon.Open();//start of the connection
                        Dbcom3.ExecuteNonQuery();//execute one prop at the time
                        DbCon.Close();//close of the connection
                    }
                }
                else
                {
                    SearchErrorEvent?.Invoke(filename);//Error event , if there is any error it will send it to the event func and stop the spacific search and start all over.
                }
      
            }
            catch (SqlException ex) //cath statment, if there is any problem with the sqlconnection / command it will bring Error and sraet a new search untill the client choose number 3.
            {
                Console.WriteLine("ERROR-" + ex.Message);//the error msg.
            }
        }
    }
}






