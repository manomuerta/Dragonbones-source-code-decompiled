package _388
{
   import _93._92;
   
   public class _409 extends _92
   {
      private var showText:String = "";
      
      private var type:String = "type:default,position:center,color:white";
      
      public function _409()
      {
         super();
      }
      
      override public function execute() : void
      {
         if(this._3376())
         {
            if(_2212)
            {
               _2212._3334._3351(this.showText,this.type);
            }
         }
      }
      
      private function _3376() : Boolean
      {
         var _loc1_:Boolean = false;
         if(_1642)
         {
            if(_1642.hasOwnProperty("type"))
            {
               this.type = _1642.type;
               if(_1642.hasOwnProperty("showText"))
               {
                  this.showText = _1642.showText;
                  return true;
               }
            }
         }
         return false;
      }
   }
}

