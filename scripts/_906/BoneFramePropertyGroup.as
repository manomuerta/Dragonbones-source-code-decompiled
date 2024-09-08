package _906
{
   import _1045.Group;
   import _1045.Label;
   import _11111._11110;
   import _11260.TweenFolderItem;
   import _1185._1197;
   import _1404._1407;
   import _472._475;
   import _668._672;
   import egret.utils.tr;
   
   public class BoneFramePropertyGroup extends Group
   {
      public var _11441:Label;
      
      public var _11335:TweenFolderItem;
      
      private var _4761:_672;
      
      private var _4044:PropertyPanel;
      
      public function BoneFramePropertyGroup()
      {
         this._11441 = new Label();
         this._11335 = new TweenFolderItem();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._11441.percentWidth = 100;
         this._11335.percentWidth = 100;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 9;
         this.top = 4;
         this.layout = _loc1_;
         this.percentWidth = 100;
         this.addElement(this._11441);
         this.addElement(this._11335);
      }
      
      public function refresh() : void
      {
         try
         {
            if(!this._4044)
            {
               this._4044 = _1407.getInstance(PropertyPanel) as PropertyPanel;
            }
            if(!this._4761)
            {
               this._4761 = this._4044.model;
            }
            if(Boolean(this._4761) && Boolean(this._4761._1836))
            {
               this._11441.text = tr("Property.frame.bone");
            }
            this._11335.refresh();
         }
         catch(error:*)
         {
            _11110.instance._11204._11132("BoneFramePropertyGroup::refresh",error);
            _475._2377(error);
         }
      }
   }
}

