package egret.managers.impl
{
   import egret.managers._1202;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class _1206 implements _1202
   {
      private var _8964:Array;
      
      private var _8965:Object;
      
      public function _1206()
      {
         this._8964 = [];
         this._8965 = {};
         super();
      }
      
      public function get cursor() : String
      {
         return Mouse.cursor;
      }
      
      public function setCursor(param1:String, param2:uint = 0) : void
      {
         this._8964[param2] = param1;
         this._8965[param1] = param2;
         this._4222();
      }
      
      public function _1602(param1:String = "") : void
      {
         if(!param1)
         {
            this._8965 = {};
            this._8964 = [];
            this._4222();
            return;
         }
         var _loc2_:uint = uint(this._8965[param1]);
         delete this._8965[param1];
         if(this._8964[_loc2_] == param1)
         {
            delete this._8964[_loc2_];
            this._4222();
         }
      }
      
      private function _4222() : void
      {
         var _loc2_:String = null;
         var _loc1_:int = int(this._8964.length);
         if(_loc1_ == 0)
         {
            Mouse.cursor = MouseCursor.AUTO;
            return;
         }
         var _loc3_:int = _loc1_;
         while(_loc3_ >= 0)
         {
            _loc2_ = this._8964[_loc3_];
            if(_loc2_)
            {
               break;
            }
            _loc3_--;
         }
         if(_loc2_)
         {
            Mouse.cursor = _loc2_;
         }
         else
         {
            Mouse.cursor = MouseCursor.AUTO;
         }
         Mouse.hide();
         Mouse.show();
      }
   }
}

