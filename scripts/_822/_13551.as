package _822
{
   import _1374.NumberRegulator;
   
   public class _13551 extends NumberRegulator
   {
      public static const MULT_NUM:String = "-.-";
      
      private var _11443:Boolean = true;
      
      private var _11442:uint = 2;
      
      public function _13551()
      {
         super();
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _9775)
         {
            _9775.restrict = "0-9";
         }
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
               this._9775.text = isNaN(param1) ? "" : int(param1).toString();
            }
            if(this.labelDisplay)
            {
               this.labelDisplay.text = isNaN(param1) ? "" : int(param1).toString();
            }
         }
      }
   }
}

