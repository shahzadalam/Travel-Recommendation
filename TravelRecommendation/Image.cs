using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TravelRecommendation
{
    public class CityImage
    {
        public string getimage(string city)
        {
            if (city.Equals("Paris"))
            {
                return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvZxKZwoQ9ZPvEHwsh6MqSeJ85kdVx3T3yCQSfFNNsHEWIS0h2";
            }
            else if (city.Equals("Manhattan"))
            {
                return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp4FzFn1BC2wbWkNSXU7hZ_s8Z8QWIaZIxQVNVooyjSsBkdz-j";
            }
            else if (city.Equals("Toledo"))
            {
                return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSspvlz2iGeQ1rkySizi7sHb5Hnhy5Qwu5w-5CWr8iKaXeYSDfu8w";
            }
            else if (city.Equals("Manhattan"))
            {
                return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp4FzFn1BC2wbWkNSXU7hZ_s8Z8QWIaZIxQVNVooyjSsBkdz-j";
            }
            else 
            {
                return "http://magazine.startus.cc/wp-content/uploads/2015/06/madrid.jpg";
            }
            
            
        }
    }
}