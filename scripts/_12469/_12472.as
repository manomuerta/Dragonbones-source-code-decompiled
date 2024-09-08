package _12469
{
   public class _12472
   {
      public var obj:Object;
      
      public function _12472(param1:Object = null)
      {
         super();
         this.obj = !!param1 ? param1 : {};
      }
      
      public function _11139(param1:String, param2:*) : void
      {
         this.obj[param1] = param2;
      }
      
      public function _12728(param1:String) : *
      {
         if(!this.obj[param1])
         {
            this.obj[param1] = {};
         }
         return this.obj[param1];
      }
      
      public function toString() : String
      {
         return JSON.stringify(this.obj);
      }
   }
}

