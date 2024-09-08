package _799
{
   import _1045._1082;
   import _1088.TreeItemRenderer;
   import _1177.UIEvent;
   import _127._163;
   import _790._795;
   
   public class _801 extends TreeItemRenderer
   {
      public var rect:_1082;
      
      public var tree:_163;
      
      public var comicTree:_795;
      
      public function _801()
      {
         super();
         this.skinName = _802;
         this.addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this.height = 10;
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         if(this.owner)
         {
            this.tree = this.owner as _163;
            this.comicTree = this.tree.owner as _795;
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 != this.rect)
         {
            if(param2.hasOwnProperty("visible"))
            {
               param2.visible = false;
            }
            if(param2.hasOwnProperty("alpha"))
            {
               param2.alpha = 0;
            }
         }
      }
   }
}

