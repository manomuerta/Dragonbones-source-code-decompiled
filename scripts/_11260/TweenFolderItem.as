package _11260
{
   import _1038._1037;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1045._1086;
   import _11111._11110;
   import _1177.IndexChangeEvent;
   import _127._140;
   import _127._141;
   import _13492._13499;
   import _1374.IconButton;
   import _1404._1407;
   import _472._475;
   import _636.AnimationEvent;
   import _668._672;
   import _73._11222;
   import _822._10616;
   import _906.PropertyPanel;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class TweenFolderItem extends _140
   {
      private static const _typeData:_1037 = new _1037([tr("Property.frame.tween.type.none"),tr("Property.frame.tween.type.line")]);
      
      private static const _rotateData:_1037 = new _1037([tr("Property.frame.tween.rotate.auto"),tr("Property.frame.tween.rotate.cw"),tr("Property.frame.tween.rotate.ccw")]);
      
      public var _11467:DropDownList;
      
      public var _11337:IconButton;
      
      public var _11465:Group;
      
      public var _11466:DropDownList;
      
      public var _11464:_10616;
      
      private var _4761:_672;
      
      private var _4044:PropertyPanel;
      
      private var _11468:Group;
      
      public function TweenFolderItem()
      {
         this._11467 = new DropDownList();
         this._11337 = new IconButton();
         this._11465 = _125._2414(0);
         this._11466 = new DropDownList();
         this._11464 = new _10616();
         this._11468 = _125._2398(0);
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         super._2438();
         _loc1_ = _125._2398(0);
         _loc1_.width = _141.RA;
         this._11468.width = _141.RA;
         this._11467.percentWidth = 100;
         this._11467.dataProvider = _typeData;
         this._11337.icon = "/assets/timeline/timeline_curve.png";
         this._11337.toolTip = tr("Timeline.autoTween.tooltip");
         this._2527.removeElement(this._11290);
         this._2527.removeElement(this.removeBtn);
         this._2527.addElement(this._11467);
         _loc1_.addElement(this._11337);
         this._2527.addElement(_loc1_);
         this._11466.percentWidth = 100;
         this._11466.toolTip = tr("Property.frame.tween.rotate.f.tooltip");
         this._11466.dataProvider = _rotateData;
         this._11464.width = 20;
         this._11464._11443 = false;
         this._11464._8236 = 1;
         this._11464._8047 = 1;
         this._11464.value = 0;
         this._11464.minimum = 0;
         this._11464.maximum = 99;
         this._11464.toolTip = tr("Property.frame.tween.rotate.n.tooltip");
         var _loc2_:_1086 = new _1086();
         var _loc3_:Label = new Label();
         var _loc4_:Label = new Label();
         _loc2_.width = _141.LA;
         _loc3_.width = _141.LB;
         _loc3_.text = tr("Property.frame.tween.rotate");
         _loc4_.text = "x";
         this._11465.percentWidth = 100;
         this._11465.addElement(_loc2_);
         this._11465.addElement(_loc3_);
         this._11465.addElement(this._11466);
         this._11468.addElement(_loc4_);
         this._11468.addElement(this._11464);
         this._11465.addElement(this._11468);
         this._2440.top += 10;
         this.title = tr("Property.frame.tween");
         this.addElement(this._11465);
         this._11467.addEventListener(IndexChangeEvent.CHANGE,this._11455);
         this._11466.addEventListener(IndexChangeEvent.CHANGE,this._11455);
         this._11464.addEventListener(Event.CHANGE,this._11455);
      }
      
      private function _11455(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this._11467:
               this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAMES_TWEEN_TYPE,[this._4761._1946,_11222.NONE._11285(this._11467.selectedIndex).tag]));
               break;
            case this._11466:
               if((param1 as IndexChangeEvent).oldIndex == 0)
               {
                  this._11464.value = 1;
               }
            case this._11464:
               this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAMES_TWEEN_ROTATE,[this._4761._1946,this._11463()]));
         }
      }
      
      private function _11463() : int
      {
         switch(this._11466.selectedIndex)
         {
            case 1:
               return this._11464.value + 1;
            case 2:
               return -(this._11464.value + 1);
            case 0:
         }
         return 0;
      }
      
      private function _11462(param1:Boolean) : void
      {
         var _loc2_:_13499 = null;
         if(param1)
         {
            this.visible = true;
            if(this._4761._1946._13642)
            {
               if(this._4761._1946._11515)
               {
                  _11222.CUSTOM;
                  this._11467.selectedIndex = -1;
                  this._11467.prompt = tr("Property.frame.tween.type.custom");
               }
               else
               {
                  this._11467.selectedIndex = _11222.LINE.tag;
               }
            }
            else
            {
               this._11467.selectedIndex = _11222.NONE.tag;
            }
            if(this._4761._1946 is _13499)
            {
               this._11465.visible = true;
               this._11465.includeInLayout = includeInLayout;
               _loc2_ = this._4761._1946 as _13499;
               if(_loc2_._13642)
               {
                  if(_loc2_.tweenRotate == 0)
                  {
                     this._11466.selectedIndex = 0;
                     this._11464.enabled = false;
                     this._11464.value = 0;
                     this._11468.alpha = 0.5;
                  }
                  else
                  {
                     if(_loc2_.tweenRotate > 0)
                     {
                        this._11466.selectedIndex = 1;
                     }
                     else
                     {
                        this._11466.selectedIndex = 2;
                     }
                     this._11464.enabled = true;
                     this._11464.value = Math.abs(_loc2_.tweenRotate) - 1;
                     this._11468.alpha = 1;
                  }
               }
               else
               {
                  param1 = false;
                  this._11466.selectedIndex = 0;
                  this._11464.enabled = false;
                  this._11464.value = 0;
                  this._11468.alpha = 0.5;
               }
            }
         }
         else
         {
            this.visible = false;
         }
         this.includeInLayout = this.visible;
         this._11465.visible = param1;
         this._11465.includeInLayout = param1;
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
            if(this._4761 && this._4761._1946 && this._4761._1946.duration > 0)
            {
               this._11462(true);
            }
            else
            {
               this._11462(false);
            }
         }
         catch(error:*)
         {
            _11110.instance._11204._11132("TweenFolderItem::refresh",error);
            _475._2377(error);
         }
      }
   }
}

