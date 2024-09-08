package _477
{
   import _51._50;
   
   public class _485 extends _494
   {
      private var _3607:String;
      
      public function _485(param1:String)
      {
         super();
         this._3607 = param1;
      }
      
      override public function run() : void
      {
         _3238.dragonBonesVO._2126 = this._3673(_3238.dragonBonesVO._2126);
         complete();
      }
      
      private function _3673(param1:Vector.<_50>) : Vector.<_50>
      {
         var _loc3_:_50 = null;
         var _loc2_:Vector.<_50> = new Vector.<_50>();
         for each(_loc3_ in param1)
         {
            if(_loc3_.name == this._3607)
            {
               _loc2_.unshift(_loc3_);
            }
            else
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
   }
}

