package _388
{
   import _93._92;
   
   public class _390 extends _92
   {
      private var isRemove:Boolean;
      
      private var items:Array;
      
      public function _390()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._3324())
         {
            if(this.isRemove)
            {
               _2212._3317._3323(this.items);
            }
            else
            {
               _2212._3317._3322(this.items);
            }
         }
      }
      
      private function _3324() : Boolean
      {
         if(_1642)
         {
            if(_1642.hasOwnProperty("isRemove"))
            {
               this.isRemove = _1642.isRemove;
               if(_1642.hasOwnProperty("items"))
               {
                  this.items = _1642.items is Array ? _1642.items : [_1642.items];
                  return Boolean(this.items) && Boolean(this.items.length);
               }
            }
         }
         return false;
      }
   }
}

