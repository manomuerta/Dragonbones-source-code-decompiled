package _906
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DataGrid;
   import _1045.Group;
   import _1045.Label;
   import _1045.List;
   import _1045.ToggleButton;
   import _1049._1053;
   import _1049._1063;
   import _1185._1197;
   import _127._11223;
   import _127._128;
   import _1374.IconButton;
   import _1374._1392;
   import _1439._1454;
   import _51._52;
   import _625._626;
   import _636.MeshEvent;
   import _658._660;
   import _658._661;
   import _658._662;
   import _668._672;
   import _890._891;
   import _915._914;
   import _915._916;
   import _915._919;
   import _924._12480;
   import _97._100;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _921 extends Group
   {
      public static const ADD_BONE_ICON:String = "/assets/button/rigBone.png";
      
      public static const DELETE_BONE_ICON:String = "/assets/button/delAnimation.png";
      
      public var _6621:_1392;
      
      public var _4197:IconButton;
      
      public var _6619:DataGrid;
      
      public var _6612:_1053;
      
      public var _6610:_1053;
      
      public var _6614:_128;
      
      public var _1825:List;
      
      public var _6607:Button;
      
      private var _6616:Boolean;
      
      private var _6620:Boolean = true;
      
      private var _4285:_660;
      
      private var _6613:_662;
      
      private var _6611:Object;
      
      private var _6615:_1037;
      
      private var _4761:_672;
      
      private var _12741:ToggleButton;
      
      private var _12742:Label;
      
      public function _921()
      {
         this._6612 = new _1053();
         this._6610 = new _1053();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         var _loc3_:Group = null;
         super._2438();
         _loc1_ = new Group();
         _loc1_.percentWidth = 100;
         _loc2_ = _125._2397();
         _loc3_ = _125._2397();
         _loc2_.height = 24;
         _loc3_.height = 24;
         this.layout = new _1197();
         this.percentWidth = 100;
         this.percentHeight = 100;
         var _loc4_:Label;
         (_loc4_ = new Label()).text = tr("Property.weight.title");
         _loc2_.addElement(_loc4_);
         this._6614 = new _128();
         this._6614.label = tr("Property.weight.edit");
         _loc2_.addElement(this._6614);
         _loc3_.right = 1;
         this._6621 = new _1392();
         this._6621.skinName = _1454;
         this._6621.icon = ADD_BONE_ICON;
         this._6621.toolTip = tr("Property.weight.add");
         this._4197 = new IconButton();
         this._4197.icon = DELETE_BONE_ICON;
         this._4197.toolTip = tr("Property.weight.remove");
         this._6607 = new Button();
         this._6607.label = tr("Property.weight.autoWeight");
         _loc3_.addElement(this._6607);
         _loc3_.addElement(this._6621);
         _loc3_.addElement(this._4197);
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(_loc3_);
         this._12742 = new Label();
         this._12742.text = tr("Property.weight.bonelist");
         this._12742.left = 20;
         var _loc5_:Group = new Group();
         _loc5_.addElement(this._12742);
         addElement(_loc5_);
         this._12741 = new ToggleButton();
         this._12741.skinName = _11223;
         this._12741.label = tr("Property.weight.add");
         this._12741.left = 36;
         this._12741.percentWidth = 100;
         var _loc6_:Group;
         (_loc6_ = new Group()).percentWidth = 100;
         _loc6_.addElement(this._12741);
         addElement(_loc6_);
         this._6619 = new DataGrid();
         this._6619.mouseChildren = false;
         this._6619.mouseEnabled = false;
         this._6619.percentWidth = 100;
         this._6619.rowHeight = 25;
         this._6619.itemRenderer = _891;
         this._6619._6609 = _1063._6608;
         this._6619.selectionIndicator = _626;
         var _loc7_:_1037 = new _1037();
         this._6612._6576 = false;
         this._6612.width = 100;
         this._6612._6602 = false;
         this._6612.editable = false;
         this._6612.itemRenderer = _916;
         this._6612._6572 = tr("Property.mesh.bone");
         _loc7_.addItem(this._6612);
         this._6610._6576 = false;
         this._6610._6602 = false;
         this._6610.editable = false;
         this._6610.itemRenderer = _919;
         this._6610._6572 = tr("Property.mesh.weight");
         _loc7_.addItem(this._6610);
         this._6619.columns = _loc7_;
         this._6619.enabled = false;
         this._1825 = new List();
         this._1825.skinName = _12480;
         this._1825.left = 36;
         this._1825.minHeight = 200;
         this._1825.minWidth = 218;
         this._1825.percentWidth = 100;
         this._1825.percentHeight = 100;
         this._1825.itemRenderer = _914;
         this._1825.mouseEnabled = true;
         this._1825.enabled = true;
         var _loc8_:Group;
         (_loc8_ = new Group()).percentWidth = 100;
         _loc8_.percentHeight = 100;
         _loc8_.addElement(this._1825);
         addElement(_loc8_);
         this._6607.left = 36;
         this._6607.percentWidth = 100;
         var _loc9_:Group;
         (_loc9_ = new Group()).percentWidth = 100;
         _loc9_.addElement(this._6607);
         addElement(_loc9_);
         this._6604();
         if(this._4761 != null)
         {
            this.refresh();
         }
      }
      
      private function _6604() : void
      {
         this._12741.addEventListener(Event.CHANGE,this._6622);
         this._4197.addEventListener(MouseEvent.CLICK,this._6617);
         this._1825.addEventListener(MeshEvent.MODIFY_WEIGHT,this._6591);
         this._1825.addEventListener(MeshEvent.MODIFY_BAR_WEIGHT,this._6605);
         this._1825.addEventListener(MeshEvent.SELECT_BINDING_BONE,this._6601);
         this._6614.addEventListener(Event.CHANGE,this.onOpen);
         this._6607.addEventListener(MouseEvent.CLICK,this._4431);
      }
      
      private function _4431(param1:MouseEvent) : void
      {
         dispatchEvent(new MeshEvent(MeshEvent.AUTO_WEIGHT,null,true));
      }
      
      private function onOpen(param1:Event) : void
      {
         this.opened = this._6614.selected;
         this._4761._4410 = this._6620;
         dispatchEvent(new MeshEvent(MeshEvent.OPEN_MODIFY_WEIGHT,this._6620,true));
         this.refresh();
      }
      
      private function _6591(param1:MeshEvent) : void
      {
         var _loc2_:Number = Number(param1.data);
         this._6611 = this._1825._2484;
         if(isNaN(_loc2_) || this._6611 == null)
         {
            return;
         }
         _loc2_ -= this._6611.weight;
         _loc2_ = Math.round(_loc2_ * 100) / 100;
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc3_:Object = {};
         _loc3_._3205 = this._6613;
         _loc3_._1836 = this._6611.bone;
         _loc3_.weight = this._6611.weight;
         _loc3_.weight = this._6611.weight;
         _loc3_.offset = _loc2_;
         dispatchEvent(new MeshEvent(MeshEvent.MODIFY_WEIGHT,_loc3_,true));
      }
      
      private function _6605(param1:MeshEvent) : void
      {
         var _loc2_:Number = Number(param1.data);
         if(this._1825 == null)
         {
            return;
         }
         if(this._1825._2484 != null)
         {
            this._6611 = this._1825._2484;
         }
         if(this._6611 == null || this._6613 == null || isNaN(_loc2_))
         {
            return;
         }
         var _loc3_:Number = this._6613._5208(this._6611.bone);
         _loc2_ -= _loc3_;
         if(_loc2_ == 0)
         {
            return;
         }
         _loc2_ = int(_loc2_ * 100) / 100;
         var _loc4_:Object;
         (_loc4_ = {})._3205 = this._6613;
         _loc4_._1836 = this._6611.bone;
         _loc4_.weight = _loc3_;
         _loc4_.offset = _loc2_;
         dispatchEvent(new MeshEvent(MeshEvent.MODIFY_BAR_WEIGHT,_loc4_,true));
      }
      
      private function _6601(param1:MeshEvent) : void
      {
         this._3989();
         dispatchEvent(new MeshEvent(MeshEvent.SELECT_BONE,param1.data,true));
      }
      
      private function _6617(param1:MouseEvent) : void
      {
         if(this._1825._2484)
         {
            dispatchEvent(new MeshEvent(MeshEvent.DELETE_BONE,null,true));
         }
      }
      
      private function _6622(param1:Event) : void
      {
         this._6616 = this._12741.selected;
         dispatchEvent(new MeshEvent(MeshEvent.MESH_RIGGING,this._6616,true));
      }
      
      public function _3834() : void
      {
         this._12741.selected = false;
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_52 = null;
         var _loc4_:Object = null;
         var _loc5_:Number = NaN;
         var _loc6_:uint = 0;
         if(this._4761 == null)
         {
            return;
         }
         this._6614.selected = this._4761._4410;
         if(!this._4761._4410)
         {
            if(this._1825._2484 != null)
            {
               this._1825._2484 = null;
            }
         }
         this._6618();
         if(this._6613 == null && this._4761._4358 && Boolean(this._4285))
         {
            this._6613 = this._4285._5209(this._4761._4358);
         }
         if(this._6613)
         {
            this._6606(this._6613);
         }
         else if(this._4285)
         {
            this._6606(null);
         }
         this._3989();
      }
      
      private function _6606(param1:_662) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         var _loc5_:Object = null;
         var _loc6_:Number = NaN;
         var _loc7_:uint = 0;
         _loc2_ = 0;
         _loc3_ = int(this._4285._2922.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._4285._2922[_loc2_];
            _loc5_ = this._6615.getItemAt(_loc2_);
            _loc6_ = !!param1 ? param1._5208(_loc4_) : -1;
            if(_loc5_ == null)
            {
               _loc5_ = {
                  "editEnable":param1 != null,
                  "bone":_loc4_,
                  "weight":_loc6_,
                  "color":_100.RIG_BONE_COLOR[_loc2_ % _100.RIG_BONE_COLOR.length]
               };
               this._6615.addItem(_loc5_);
            }
            else
            {
               _loc7_ = uint(_100.RIG_BONE_COLOR[_loc2_ % _100.RIG_BONE_COLOR.length]);
               if(_loc5_.bone != _loc4_ || _loc5_.weight != _loc6_ || _loc5_.color != _loc7_)
               {
                  _loc5_.bone = _loc4_;
                  _loc5_.weight = _loc6_;
                  _loc5_.color = _loc7_;
               }
               _loc5_.editEnable = param1 != null;
               this._6615._4016(_loc5_);
            }
            _loc2_++;
         }
      }
      
      private function _6618() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_52 = null;
         var _loc4_:Object = null;
         if(this._6615 == null)
         {
            this._6615 = new _1037();
            this._1825.dataProvider = this._6615;
         }
         if(this._4285)
         {
            if(this._6615.length > this._4285._2922.length)
            {
               _loc1_ = 0;
               _loc2_ = this._6615.length;
               while(_loc1_ < _loc2_)
               {
                  _loc4_ = this._6615.getItemAt(_loc1_);
                  if(_loc1_ < this._4285._2922.length && _loc4_ && _loc4_.bone == this._4285._2922[_loc1_])
                  {
                     if(_loc4_.bone == this._4761._4395)
                     {
                        this._1825._2484 = _loc4_;
                     }
                  }
                  else
                  {
                     this._6615.removeItemAt(_loc1_);
                     _loc1_--;
                     _loc2_--;
                  }
                  _loc1_++;
               }
            }
            if(this._4761._4395 != null)
            {
               _loc1_ = 0;
               _loc2_ = this._6615.length;
               while(_loc1_ < _loc2_)
               {
                  _loc4_ = this._6615.getItemAt(_loc1_);
                  if(_loc4_.bone == this._4761._4395)
                  {
                     this._1825._2484 = _loc4_;
                  }
                  _loc1_++;
               }
            }
         }
      }
      
      private function _6603(param1:_52) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         _loc2_ = 0;
         _loc3_ = this._6615.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._6615.getItemAt(_loc2_);
            if((Boolean(_loc4_)) && _loc4_.bone == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      private function _3989() : void
      {
         this._4197.enabled = this._6620 && this._1825._2484 != null;
         this._6619.enabled = this._6620;
         this._6619.visible = this._6620;
         this._4197.visible = this._6620;
         this._1825.enabled = this._6620;
         this._1825.visible = this._6620;
         this._6607.visible = this._6620;
         this._6607.enabled = Boolean(this._4285) && this._4285._2922.length > 1;
         this._12741.enabled = this._2165();
         this._6619.enabled = this._4285 != null;
         this._12742.alpha = this._12741.enabled ? 1 : 0.5;
      }
      
      public function set meshRig(param1:_660) : void
      {
         if(this._4285 != param1)
         {
            this._4285 = param1;
            this._6613 = null;
            this._6615 = null;
         }
         if(this._4285 == null)
         {
            this._6613 = null;
         }
      }
      
      public function set opened(param1:Boolean) : void
      {
         this._3989();
      }
      
      public function _4395(param1:_52) : void
      {
         this.refresh();
      }
      
      public function _4358(param1:_661) : void
      {
         this._6613 = null;
         this.refresh();
      }
      
      public function set model(param1:_672) : void
      {
         this._4761 = param1;
         this._6613 = null;
         this.refresh();
      }
      
      private function _2165() : Boolean
      {
         if(this._4761 && this._4761.displayVO && this._4761._1837 && this._4761._1837._2049 == this._4761.displayVO && this._4761._1837._13687 == null)
         {
            return this._4761.displayVO._2165;
         }
         return false;
      }
   }
}

