package _1376
{
   import _1374.DropDownList;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1377 extends DropDownList
   {
      private var _2541:String;
      
      private var _7623:Boolean;
      
      public function _1377()
      {
         super();
      }
      
      public function get label() : String
      {
         return this._2541;
      }
      
      public function set label(param1:String) : void
      {
         if(this._2541 == param1)
         {
            return;
         }
         this._2541 = param1;
         this._7623 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._7623)
         {
            this._7623 = false;
            labelDisplay.text = this._2541;
         }
      }
      
      override ns_egret function _7430(param1:* = undefined) : void
      {
      }
   }
}

