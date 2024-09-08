package _11260
{
   import _1045.Group;
   import _1045.Label;
   import _1045._1086;
   import _11111._11110;
   import _1185._1197;
   import _127._140;
   import _127._141;
   import _1374.IconButton;
   import _1374.TextInput;
   import _1404._1407;
   import _40._44;
   import _470._11495;
   import _472._475;
   import _51._52;
   import _521._530;
   import _555._570;
   import _6.Context;
   import _636.AnimationEvent;
   import _639._638;
   import _668._672;
   import _708._715;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _906.PropertyPanel;
   import _97._125;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class EventFolderItem extends _140
   {
      public var _11343:TextInput;
      
      public var _6516:Label;
      
      public var _11459:IconButton;
      
      public var _11461:TextInput;
      
      public var _11458:TextInput;
      
      public var inputString:TextInput;
      
      public var _11486:Group;
      
      private var _4761:_672 = null;
      
      private var _4044:PropertyPanel = null;
      
      private var _3670:_44 = null;
      
      public function EventFolderItem()
      {
         this._11343 = new TextInput();
         this._6516 = new Label();
         this._11459 = new IconButton();
         this._11461 = new TextInput();
         this._11458 = new TextInput();
         this.inputString = new TextInput();
         super();
      }
      
      public function get vo() : _44
      {
         return this._3670;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Label = null;
         super._2438();
         this._2527.addElementAt(this._11343,this._2527.getElementIndex(this._11290));
         this._2527.removeElement(this._11290);
         this._6516.percentWidth = 100;
         this._11459.icon = "/assets/button/ikcf.png";
         this._11459.toolTip = tr("Property.frame.event.target.tooltip");
         this._11343.percentWidth = 100;
         this._11343.text = "";
         this._11461.percentWidth = 100;
         this._11461.restrict = "0-9\\-";
         this._11461.maxChars = 10;
         this._11458.percentWidth = 100;
         this._11458.restrict = "0-9\\-.";
         this._11458.maxChars = 20;
         this.inputString.percentWidth = 100;
         _loc1_ = new Label();
         var _loc2_:Label = new Label();
         var _loc3_:Label = new Label();
         var _loc4_:Label = new Label();
         _loc1_.width = _141.LB;
         _loc1_.text = tr("Property.frame.event.target");
         _loc2_.width = _141.LB;
         _loc2_.text = tr("Property.frame.event.ints");
         _loc3_.width = _141.LB;
         _loc3_.text = tr("Property.frame.event.floats");
         _loc4_.width = _141.LB;
         _loc4_.text = tr("Property.frame.event.strings");
         this._11486 = _125._2414(0);
         var _loc5_:Group = _125._2414(0);
         var _loc6_:Group = _125._2414(0);
         var _loc7_:Group = _125._2414(0);
         this._11486.percentWidth = 100;
         _loc5_.percentWidth = 100;
         _loc6_.percentWidth = 100;
         _loc7_.percentWidth = 100;
         var _loc8_:_1086 = new _1086();
         var _loc9_:_1086 = new _1086();
         var _loc10_:_1086 = new _1086();
         var _loc11_:_1086 = new _1086();
         _loc8_.width = _141.LA;
         _loc9_.width = _141.LA;
         _loc10_.width = _141.LA;
         _loc11_.width = _141.LA;
         this._11486.addElement(_loc8_);
         this._11486.addElement(_loc1_);
         this._11486.addElement(this._6516);
         this._11486.addElement(this._11459);
         _loc5_.addElement(_loc9_);
         _loc5_.addElement(_loc2_);
         _loc5_.addElement(this._11461);
         _loc6_.addElement(_loc10_);
         _loc6_.addElement(_loc3_);
         _loc6_.addElement(this._11458);
         _loc7_.addElement(_loc11_);
         _loc7_.addElement(_loc4_);
         _loc7_.addElement(this.inputString);
         this._2440.top += 10;
         this.title = tr("Property.frame.event.event");
         this.layout = new _1197();
         this.addElement(this._11486);
         this.addElement(_loc5_);
         this.addElement(_loc6_);
         this.addElement(_loc7_);
         removeBtn.addEventListener(MouseEvent.CLICK,this._11456);
         this._11459.addEventListener(MouseEvent.CLICK,this._11456);
         this._11343.focusRect = null;
         this._11461.focusRect = null;
         this.inputString.focusRect = null;
         this._11458.focusRect = null;
         this._11343.addEventListener(FocusEvent.FOCUS_OUT,this._11455);
         this._11461.addEventListener(FocusEvent.FOCUS_OUT,this._11455);
         this._11458.addEventListener(FocusEvent.FOCUS_OUT,this._11455);
         this.inputString.addEventListener(FocusEvent.FOCUS_OUT,this._11455);
         this._6516.addEventListener(MouseEvent.CLICK,this._11456);
         this._6516.addEventListener(MouseEvent.ROLL_OVER,this._11457);
         this._6516.addEventListener(MouseEvent.ROLL_OUT,this._11457);
         this._2526.selected = true;
         this._2525 = true;
         this._2466();
      }
      
      private function _11456(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case removeBtn:
               this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.DEL_FRAME_ACTION,[this._4761._13803,this._3670]));
               this._4044.stage.focus = this.stage;
               break;
            case this._6516:
               break;
            case this._11459:
               _530.instance._3833(this._3670,this._11460,null,false);
               this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.PICK_BONE));
         }
      }
      
      private function _11457(param1:Event) : void
      {
         var _loc2_:_570 = null;
         var _loc3_:_52 = null;
         if(this._3670.event.bone)
         {
            _loc2_ = _1407.getInstance(_570) as _570;
            _loc3_ = this._3670.event.bone;
            switch(param1.type)
            {
               case MouseEvent.ROLL_OVER:
                  this._6516.textColor = 5941489;
                  _loc2_._1567(new StageNotification(StageNotification.ROLLOVER_BONE,_loc3_));
                  break;
               case MouseEvent.ROLL_OUT:
                  this._6516.textColor = 16777215;
                  _loc2_._1567(new StageNotification(StageNotification.ROLLOUT_BONE,_loc3_));
            }
         }
      }
      
      private function _11460(param1:_44, param2:_52) : void
      {
         if(param1 && param2 && Boolean(param1.event))
         {
            this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAME_EVENT,[param1,3,param2]));
         }
      }
      
      private function _11455(param1:Event) : void
      {
         if((param1.currentTarget as TextInput).text == "\x19")
         {
            return;
         }
         switch(param1.currentTarget)
         {
            case this._11343:
               if(this._3670.value != this._11343.text)
               {
                  _11495._11570(CommandNotification.MODIFY_FRAME_ACTION,_11495.create(this._3670).add("value",this._11343.text),this._13976);
               }
               break;
            case this._11461:
               this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAME_EVENT,[this._3670,0,this._11461.text]));
               break;
            case this._11458:
               this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAME_EVENT,[this._3670,1,this._11458.text]));
               break;
            case this.inputString:
               this._4044.dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_FRAME_EVENT,[this._3670,2,this.inputString.text]));
         }
      }
      
      private function _13976() : void
      {
         this._2853.refresh();
      }
      
      public function refresh(param1:_44) : void
      {
         var bone:_52 = null;
         var vo:_44 = param1;
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
            this._3670 = vo;
            if(Boolean(this._3670) && Boolean(this._3670.event))
            {
               this._4761._1886;
               if(this._11486)
               {
                  this._11486.visible = (Context.getInstance()._1568.appModel as _638)._2220._2873 == _715.ANIMATE;
                  this._11486.includeInLayout = this._11486.visible;
               }
               this._11343.text = this._3670.value;
               bone = !!this._3670.event.bone ? this._4761._1886._1817(this._3670.event.bone.name) : null;
               if(bone)
               {
                  this._6516.enabled = true;
                  this._6516.alpha = 1;
                  this._6516.text = bone.name;
               }
               else
               {
                  this._6516.enabled = false;
                  this._6516.alpha = 0.5;
                  this._6516.text = tr("Property.frame.event.target.none");
                  this._3670.event.bone = null;
               }
               if(this._3670.event.ints.length > 0)
               {
                  this._11461.text = this._3670.event.ints[0];
               }
               else
               {
                  this._11461.text = "";
                  this._11461.prompt = tr("Property.frame.event.target.none");
               }
               if(this._3670.event.floats.length > 0)
               {
                  this._11458.text = this._3670.event.floats[0];
               }
               else
               {
                  this._11458.text = "";
                  this._11458.prompt = tr("Property.frame.event.target.none");
               }
               if(this._3670.event.strings.length > 0)
               {
                  this.inputString.text = this._3670.event.strings[0];
               }
               else
               {
                  this.inputString.text = "";
                  this.inputString.prompt = tr("Property.frame.event.target.none");
               }
            }
         }
         catch(error:*)
         {
            _11110.instance._11204._11132("EventFolderItem::refresh",error);
            _475._2377(error);
         }
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

