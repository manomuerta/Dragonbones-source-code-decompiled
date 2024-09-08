package _1439
{
   import _1045._1082;
   import _1185._1188;
   import _1185._1197;
   import _1225._1242;
   import _1374.IconItemRenderer;
   import _1477._1257;
   
   public class _1456 extends _1225._1242
   {
      private var rect:_1082;
      
      public function _1456()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.rect = new _1082();
         this.rect.fillColor = 1975081;
         this.rect.left = 0;
         this.rect.right = 0;
         this.rect.bottom = 0;
         this.rect.top = 0;
         this.addElement(this.rect);
         _2491.skinName = _1257;
         _2491.left = 1;
         _2491.top = 1;
         _2491.right = 1;
         _2491.bottom = 1;
         _2491._6243 = 0;
         this.addElement(_2491);
         _2490.itemRenderer = IconItemRenderer;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 0;
         _loc1_._2401 = _1188.CONTENT_JUSTIFY;
         _2490.layout = _loc1_;
         _2491.viewport = _2490;
      }
   }
}

