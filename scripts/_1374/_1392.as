package _1374
{
   import _1045.ToggleButton;
   import _1045._1105;
   
   public class _1392 extends ToggleButton
   {
      private var _icon:String = "";
      
      public var _2448:_1105;
      
      public function _1392()
      {
         super();
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function set icon(param1:String) : void
      {
         this._icon = param1;
         if(this._2448)
         {
            this._2448.source = this._icon;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2448)
         {
            this._2448.source = this._icon;
         }
      }
   }
}

