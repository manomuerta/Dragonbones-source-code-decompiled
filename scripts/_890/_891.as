package _890
{
   import _1045.Label;
   import _1049._1057;
   
   public class _891 extends _1049._1057
   {
      public var _6486:_889;
      
      public var _6487:Label;
      
      public function _891()
      {
         super();
         this.skinName = _892;
      }
      
      override public function prepare(param1:Boolean) : void
      {
         super.prepare(param1);
         if(Boolean(data) && Boolean(data.ooo))
         {
            if(data.ooo.enabled == 1)
            {
               this._6487.alpha = 1;
            }
            else
            {
               this._6487.alpha = 0.3;
            }
         }
      }
   }
}

