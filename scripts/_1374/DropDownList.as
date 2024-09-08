package _1374
{
   import _1045.DropDownList;
   
   public class DropDownList extends _1045.DropDownList
   {
      public var _9727:String = "left";
      
      private var _9686:Number = 300;
      
      public function DropDownList()
      {
         super();
      }
      
      public function get _9687() : Number
      {
         return this._9686;
      }
      
      public function set _9687(param1:Number) : void
      {
         this._9686 = param1;
         if(_2490)
         {
            if(this._9686 == -1)
            {
               _2490.maxHeight = 10000;
            }
            else
            {
               _2490.maxHeight = this._9686;
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2490)
         {
            if(this._9686 == -1)
            {
               _2490.maxHeight = 10000;
            }
            else
            {
               _2490.maxHeight = this._9686;
            }
         }
      }
   }
}

