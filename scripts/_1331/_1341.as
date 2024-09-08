package _1331
{
   import flash.events.Event;
   
   public class _1341 extends _1339
   {
      public function _1341()
      {
         super();
         this.serverURL = _1335.USER_URL;
      }
      
      override protected function _5957(param1:Event) : void
      {
         var o:Object = null;
         var event:Event = param1;
         var data:String = event.target.data;
         data = this.format(data);
         try
         {
            o = JSON.parse(data);
         }
         catch(error:Error)
         {
            o = {};
         }
         this.parse(o);
         if(_1580 != null)
         {
            _1580(o);
         }
      }
      
      protected function parse(param1:Object) : void
      {
      }
      
      private function format(param1:String) : String
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         try
         {
            JSON.parse(param1);
            return param1;
         }
         catch(error:Error)
         {
         }
         var _loc2_:Array = param1.split("<&>");
         if(_loc2_.length > 0)
         {
            _loc3_ = {};
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc5_ = String(_loc2_[_loc4_]).split(/(.*?)=(.*)/);
               _loc3_[_loc5_[1]] = _loc5_[2];
               _loc4_++;
            }
            param1 = JSON.stringify(_loc3_);
         }
         return param1;
      }
   }
}

