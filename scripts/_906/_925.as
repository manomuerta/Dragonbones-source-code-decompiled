package _906
{
   import _127._140;
   import _668._672;
   import _924._12482;
   import egret.utils.tr;
   
   public class _925 extends _140
   {
      public var _4406:_911;
      
      public function _925()
      {
         this._4406 = new _911();
         super();
         this.skinName = _12482;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.removeBtn.visible = false;
         this._4406.y = 10;
         this._4406._6571 = true;
         this.addElement(this._4406);
         this._2526.labelDisplay.maxWidth = 200;
      }
      
      public function set model(param1:_672) : void
      {
         if(param1._1837 != null && param1.displayVO == null)
         {
            param1.displayVO = param1._1837._2049;
            if(param1.displayVO)
            {
               this.title = tr("property.slot.displayTitle");
            }
         }
         param1._4358 = null;
         this._4406.model = param1;
      }
   }
}

