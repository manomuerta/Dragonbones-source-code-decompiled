package _822
{
   import _1374.NumberRegulator;
   import _97._14036;
   
   public class _10616 extends NumberRegulator
   {
      public static const MULT_NUM:String = "-.-";
      
      public var _11443:Boolean = true;
      
      public var _11442:uint = 2;
      
      public function _10616()
      {
         super();
      }
      
      override protected function _8231(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(this._11443)
         {
            _loc3_ = super._8231(param1,param2);
            return Number(_loc3_.toFixed(this._11442));
         }
         return super._8231(param1,param2);
      }
      
      override protected function setValue(param1:Number) : void
      {
         super.setValue(param1);
         if(this._11443)
         {
            if(isNaN(param1))
            {
               this.value = param1;
            }
            if(this._9775)
            {
               this._9775.text = isNaN(param1) ? "" : param1.toFixed(this._11442);
            }
            if(this.labelDisplay)
            {
               this.labelDisplay.text = isNaN(param1) ? "" : param1.toFixed(this._11442);
            }
         }
      }
      
      public function set _13395(param1:String) : void
      {
      }
      
      public function _14319() : void
      {
         this._9774();
      }
      
      override protected function _9773() : void
      {
         super._9773();
         _14036._9587 = true;
         _14036._14317 = _14036._14316(this);
      }
      
      override protected function _9774(param1:Boolean = true) : void
      {
         super._9774(param1);
         _14036._9587 = false;
      }
   }
}

