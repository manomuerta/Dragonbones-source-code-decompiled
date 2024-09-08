package _777
{
   public class _10255
   {
      public var path:String;
      
      public var lastEditTime:int;
      
      public var editTime:int;
      
      public var projectType:int;
      
      public var dataSavePath:String;
      
      public var dataLastEditTime:Number = 0;
      
      public var op:int = 2;
      
      public function _10255(param1:Object = null)
      {
         var _loc2_:String = null;
         super();
         if(param1)
         {
            for(_loc2_ in param1)
            {
               if(_loc2_ == "path")
               {
                  this.path = param1[_loc2_];
               }
               else if(_loc2_ == "lastEditTime")
               {
                  this.lastEditTime = param1[_loc2_];
               }
               else if(_loc2_ == "editTime")
               {
                  this.editTime = param1[_loc2_];
               }
               else if(_loc2_ == "projectType")
               {
                  this.projectType = param1[_loc2_];
               }
               else if(_loc2_ == "dataSavePath")
               {
                  this.dataSavePath = param1[_loc2_];
               }
               else if(_loc2_ == "dataLastEditTime")
               {
                  this.dataLastEditTime = param1[_loc2_];
               }
            }
         }
      }
      
      public function _10373() : Object
      {
         var _loc1_:Object = {};
         _loc1_["path"] = this.path;
         _loc1_["lastEditTime"] = this.lastEditTime;
         _loc1_["editTime"] = this.editTime;
         _loc1_["projectType"] = this.projectType;
         _loc1_["dataSavePath"] = this.dataSavePath;
         _loc1_["dataLastEditTime"] = this.dataLastEditTime;
         return _loc1_;
      }
   }
}

