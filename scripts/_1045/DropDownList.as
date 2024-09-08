package _1045
{
   import _1088._1092;
   import egret.core._1117;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class DropDownList extends _1092
   {
      public var labelDisplay:_1117;
      
      private var _7623:Boolean = false;
      
      private var _7447:String = "";
      
      public function DropDownList()
      {
         super();
      }
      
      public function get prompt() : String
      {
         return this._7447;
      }
      
      public function set prompt(param1:String) : void
      {
         if(this._7447 == param1)
         {
            return;
         }
         this._7447 = param1;
         this._7623 = true;
         _2466();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._7623)
         {
            this._7623 = false;
            this.ns_egret::_7430();
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.labelDisplay)
         {
            this._7623 = true;
            _2466();
         }
      }
      
      override ns_egret function _7430(param1:* = undefined) : void
      {
         if(this.labelDisplay)
         {
            if(param1 == undefined)
            {
               param1 = _2484;
            }
            if(param1 != null && param1 != undefined)
            {
               this.labelDisplay.text = _7442(param1);
            }
            else
            {
               this.labelDisplay.text = this._7447;
            }
         }
      }
   }
}

