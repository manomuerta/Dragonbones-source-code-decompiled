package _1416
{
   public class _1415
   {
      private var _8603:String = "";
      
      public var _9908:int;
      
      public var _9458:int;
      
      public function _1415()
      {
         super();
      }
      
      public function get content() : String
      {
         return !!this._8603 ? this._8603 : "";
      }
      
      public function set content(param1:String) : void
      {
         this._8603 = !!param1 ? param1 : "";
      }
      
      public function get length() : int
      {
         return this.content.length;
      }
   }
}

