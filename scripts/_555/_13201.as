package _555
{
   import _1038._1037;
   import _1177.DragEvent;
   import _1177.UIEvent;
   import _13212.SheetPanel;
   import _13212._13213;
   import _1404._1407;
   import _15.DBDragFormat;
   import _24.Shortcut;
   import _24._26;
   import _470._469;
   import _51._50;
   import _51._70;
   import _51._79;
   import _521._528;
   import _579._580;
   import _586._596;
   import _586._603;
   import _6._9;
   import _636.SheetEvent;
   import _648._13209;
   import _648._665;
   import _708._715;
   import _708._717;
   import _724._725;
   import _73.SymbolType;
   import _783.CommandNotification;
   import _783.SheetNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _783.TipNotification;
   import _859._862;
   import _93._94;
   import _948._951;
   import egret.core._1111;
   import egret.managers.DragManager;
   import egret.utils.FileUtil;
   import egret.utils._99;
   import egret.utils.tr;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.desktop.NativeDragActions;
   import flash.desktop.NativeDragManager;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.events.NativeDragEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class _13201 extends _94
   {
      public static const EXTENSION_PNG:String = "png";
      
      public static const EXTENSION_JPG:String = "jpg";
      
      public static const EXTENSION_JPEG:String = "jpeg";
      
      public static var _13295:Dictionary = new Dictionary();
      
      private var _13306:SheetPanel;
      
      private var _13322:_13213;
      
      private var _13307:_13209;
      
      private var _13286:_1037;
      
      private var _6620:Boolean;
      
      private var _6919:Boolean;
      
      private var _13320:Timer;
      
      private var _lastTime:int;
      
      private var _5099:int;
      
      private var _13325:int;
      
      private var _13296:int;
      
      private var _6995:int;
      
      private var _13305:int;
      
      public function _13201()
      {
         super();
         this._13306 = _1407.getInstance(SheetPanel) as SheetPanel;
         this._13320 = new Timer(16);
         this._13320.addEventListener(TimerEvent.TIMER,this._13308);
      }
      
      private function _13308(param1:TimerEvent) : void
      {
         this._5099 = getTimer();
         this._13325 += this._5099 - this._lastTime;
         var _loc2_:int = this._13325 / this._13296;
         var _loc3_:int = this._13325 % this._13296;
         if(_loc2_ > 0)
         {
            this._6995 += _loc2_;
            this._13329(this._6995);
            if((this._6995 + 1) % this._13307._13225.length == 0)
            {
               ++this._13305;
               if(!this._13307.loop && this._13307._13253 > 0)
               {
                  if(this._13305 == this._13307._13253)
                  {
                     _1567(new SheetNotification(SheetNotification.STOP_PLAY));
                  }
               }
            }
         }
         this._13325 -= _loc2_ * this._13296;
         this._lastTime = this._5099;
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.UPDATE_EDIT_MODE,this._10781);
         _1565(StageNotification.UPDATE_CURRENT_ARMATURE,this._3973);
         this._13306.addEventListener(UIEvent.CREATION_COMPLETE,this._4321);
      }
      
      private function _13285(param1:_9) : void
      {
         this._13243();
      }
      
      private function _3973(param1:StageNotification) : void
      {
         var _loc2_:_79 = null;
         this._2871 = _2214._1844._2871;
         if(Boolean(_3028) && _3028._1811 == SymbolType.SHEET)
         {
            if(Boolean(_3028._1780) && _3028._1780.length == 1)
            {
               _loc2_ = _3028._1780[0];
               if(_loc2_)
               {
                  _2226._2484 = _loc2_;
               }
            }
         }
      }
      
      private function _4321(param1:UIEvent) : void
      {
         if(this._6620)
         {
            this._4906();
         }
      }
      
      private function _10527() : void
      {
         _1564(SheetNotification.SELECT_FRAME,this._13291);
         _1564(SheetNotification.PLAY,this._4762);
         _1564(SheetNotification.STOP_PLAY,this._13321);
         _1564(StageNotification.UPDATE_SELECTED_ITEMS,this._13285);
         _1564(SheetNotification.UPDATE_CUR_DISPLAY,this._13285);
         if(this._13322 == null)
         {
            return;
         }
         this._13322.removeEventListener(Event.CHANGE,this._13313);
         this._13322.removeEventListener(SheetEvent.DELETE_FRAME,this._13294);
         this._13322.removeEventListener(DragEvent.DRAG_DROP,this._13333);
         this._13306._4758.removeEventListener(Event.CHANGE,this._13314);
         this._13306._4722.removeEventListener(MouseEvent.CLICK,this._4736);
         this._13306._4721.removeEventListener(MouseEvent.CLICK,this._4735);
         this._13306._4719.removeEventListener(MouseEvent.CLICK,this._13304);
         this._13306._4727.removeEventListener(MouseEvent.CLICK,this._13316);
         this._13306._6502.removeEventListener(FocusEvent.FOCUS_OUT,this._13315);
         this._13306._13317.removeEventListener(FocusEvent.FOCUS_OUT,this._3988);
         this._13306._13323.removeEventListener(Event.CHANGE,this._13303);
         this._13306._13318.removeEventListener(MouseEvent.CLICK,this._13328);
         this._13306._13302.removeEventListener(MouseEvent.CLICK,this._13310);
         this._13306._4197.removeEventListener(MouseEvent.CLICK,this._13298);
         this._13306._13300.removeEventListener(Event.CHANGE,this._4711);
         this._13306._13293.removeEventListener(Event.CHANGE,this._4711);
         this._13306._13289.removeEventListener(Event.CHANGE,this._13284);
         this._13306.removeEventListener(DragEvent.DRAG_DROP,this._13287);
         this._13306.removeEventListener(DragEvent.DRAG_ENTER,this._6465);
         this._13306.removeEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.onDragIn);
         this._13306.removeEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.onDragIn);
         this._13306.removeEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this.onDragIn);
         if(stage)
         {
            Shortcut._1673(stage,_26.DELETE,this._13297);
            Shortcut._1673(stage,_26.NEXT_FRAME,this._4695);
            Shortcut._1673(stage,_26.PREV_FRAME,this._4696);
            Shortcut._1673(stage,_26.PLAY,this._13309);
         }
      }
      
      private function _5476() : void
      {
         _1565(SheetNotification.SELECT_FRAME,this._13291);
         _1565(SheetNotification.PLAY,this._4762);
         _1565(SheetNotification.STOP_PLAY,this._13321);
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._13285,-1);
         _1565(SheetNotification.UPDATE_CUR_DISPLAY,this._13285);
         if(this._13322 == null)
         {
            return;
         }
         this._13322.addEventListener(Event.CHANGE,this._13313);
         this._13322.addEventListener(SheetEvent.DELETE_FRAME,this._13294);
         this._13322.addEventListener(DragEvent.DRAG_DROP,this._13333);
         this._13306._4758.addEventListener(Event.CHANGE,this._13314);
         this._13306._4722.addEventListener(MouseEvent.CLICK,this._4736);
         this._13306._4721.addEventListener(MouseEvent.CLICK,this._4735);
         this._13306._4719.addEventListener(MouseEvent.CLICK,this._13304);
         this._13306._4727.addEventListener(MouseEvent.CLICK,this._13316);
         this._13306._6502.addEventListener(FocusEvent.FOCUS_OUT,this._13315);
         this._13306._13317.addEventListener(FocusEvent.FOCUS_OUT,this._3988);
         this._13306._13323.addEventListener(Event.CHANGE,this._13303);
         this._13306._13318.addEventListener(MouseEvent.CLICK,this._13328);
         this._13306._13302.addEventListener(MouseEvent.CLICK,this._13310);
         this._13306._4197.addEventListener(MouseEvent.CLICK,this._13298);
         this._13306._13300.addEventListener(Event.CHANGE,this._4711);
         this._13306._13293.addEventListener(Event.CHANGE,this._4711);
         this._13306._13289.addEventListener(Event.CHANGE,this._13284);
         this._13306.addEventListener(DragEvent.DRAG_DROP,this._13287);
         this._13306.addEventListener(DragEvent.DRAG_ENTER,this._6465);
         this._13306.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.onDragIn);
         this._13306.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.onDragIn);
         this._13306.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this.onDragIn);
         if(stage)
         {
            Shortcut._1681(stage,_26.DELETE,this._13297);
            Shortcut._1681(stage,_26.NEXT_FRAME,this._4695);
            Shortcut._1681(stage,_26.PREV_FRAME,this._4696);
            Shortcut._1681(stage,_26.PLAY,this._13309);
         }
      }
      
      private function _13309() : void
      {
         if(this._6919)
         {
            _1567(new SheetNotification(SheetNotification.STOP_PLAY));
         }
         else
         {
            _1567(new SheetNotification(SheetNotification.PLAY));
         }
      }
      
      private function _4695() : void
      {
         if(this._6919)
         {
            return;
         }
         this._4736(null);
      }
      
      private function _4696() : void
      {
         if(this._6919)
         {
            return;
         }
         this._4735(null);
      }
      
      private function _13297() : void
      {
         if(!this._2861._4152(stage.focus))
         {
            this._13312(null);
         }
      }
      
      private function onDragIn(param1:NativeDragEvent) : void
      {
         var _loc2_:Clipboard = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:Vector.<File> = null;
         var _loc7_:File = null;
         _loc2_ = param1.clipboard;
         if(_loc2_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case NativeDragEvent.NATIVE_DRAG_ENTER:
               if(_loc2_.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
               {
                  if(_2220._2873 == _715.SHEET)
                  {
                     NativeDragManager.acceptDragDrop(this._13306);
                     NativeDragManager.dropAction = NativeDragActions.MOVE;
                  }
               }
               break;
            case NativeDragEvent.NATIVE_DRAG_DROP:
               _loc4_ = [];
               _loc5_ = _loc2_.getData(ClipboardFormats.FILE_LIST_FORMAT);
               if(_2220._2873 == _715.SHEET)
               {
                  _loc6_ = new Vector.<File>();
                  for each(_loc7_ in _loc5_)
                  {
                     if(_loc7_)
                     {
                        _loc3_ = FileUtil.getExtension(_loc7_.nativePath);
                        _loc3_ = _loc3_.toLowerCase();
                        if(_loc3_ == EXTENSION_PNG || _loc3_ == EXTENSION_JPG || _loc3_ == EXTENSION_JPEG)
                        {
                           _loc6_.push(_loc7_);
                        }
                     }
                  }
                  if(_loc6_.length > 0)
                  {
                     this._13239(_loc6_);
                  }
               }
         }
      }
      
      private function _13283(param1:File) : void
      {
         var _loc2_:String = null;
         if(!this._2861._3678)
         {
            return;
         }
         _loc2_ = this._2861._3678._3680() + "/" + param1.name;
         _loc2_ = FileUtil.escapePath(_loc2_);
         var _loc3_:String = FileUtil.getFileName(_loc2_);
         if(Boolean(param1) && !this._2861.hasFile(param1.nativePath))
         {
            if(param1.size > LibraryPanelController.MAX_FILE_SIZE)
            {
               _1567(new TipNotification(TipNotification.TIP_ALERT,tr("LibraryPanel.error.outOfSize")));
               return;
            }
            this._2861.saveToLibrary(param1);
         }
      }
      
      private function _13239(param1:Vector.<File>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:_725 = null;
         if(!this._2861._3678)
         {
            return;
         }
         var _loc4_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            this._13283(param1[_loc2_]);
            _loc4_.push(FileUtil.getFileName(param1[_loc2_].name));
            _loc2_++;
         }
         this._2861._4188();
         var _loc6_:Vector.<_725> = new Vector.<_725>();
         _loc2_ = 0;
         _loc3_ = int(_loc4_.length);
         while(_loc2_ < _loc3_)
         {
            _loc5_ = this._2106._3806(_loc4_[_loc2_]);
            if(_loc5_)
            {
               _loc6_.push(_loc5_);
            }
            _loc2_++;
         }
         if(_loc6_.length > 0)
         {
            _1567(new StageNotification(StageNotification.DRAG_IAMGES_TO_STAGE,{
               "imageFile":_loc6_,
               "position":new Point()
            }));
         }
      }
      
      private function _6465(param1:DragEvent) : void
      {
         DragManager.acceptDragDrop(this._13306);
      }
      
      private function _13287(param1:DragEvent) : void
      {
         var _loc3_:Vector.<_862> = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Point = null;
         var _loc7_:Number = NaN;
         var _loc8_:_862 = null;
         var _loc9_:Point = null;
         var _loc2_:_1111 = param1._1611;
         if(_loc2_.hasFormat(DBDragFormat.IMAGE))
         {
            _loc3_ = _loc2_._4508(DBDragFormat.IMAGE) as Vector.<_862>;
            if(Boolean(_loc3_) && Boolean(_loc3_.length))
            {
               _loc4_ = [];
               _loc5_ = [];
               _loc6_ = new Point();
               _loc7_ = _loc3_[0].parent.scaleX;
               for each(_loc8_ in _loc3_)
               {
                  _loc4_.push(_70._2090(_loc8_._2104));
                  _loc9_ = new Point();
                  _loc5_.push(_loc9_);
               }
               this._5342(_loc4_,_loc5_);
            }
         }
      }
      
      protected function _5342(param1:Array, param2:Array, param3:Boolean = false) : void
      {
         var _loc8_:Object = null;
         var _loc9_:_70 = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc4_:_50 = this._13307._1886;
         var _loc5_:_79 = _loc4_._1780[0];
         var _loc6_:String = _loc4_._1795.name;
         var _loc7_:Array = [];
         _loc11_ = 0;
         _loc10_ = int(param1.length);
         while(_loc11_ < _loc10_)
         {
            _loc9_ = param1[_loc11_];
            if(!_loc5_._2159(_loc9_.name))
            {
               _loc8_ = _469._2895(_loc9_,_loc6_,_loc5_);
               _loc7_.push(_loc8_);
            }
            else
            {
               _loc12_ = _loc5_._13231(_loc9_.name);
               _loc9_._13228 = _loc12_;
               _loc8_ = _469._2895(_loc9_,_loc6_,_loc5_);
               _loc7_.push(_loc8_);
            }
            _loc11_++;
         }
         _1567(new CommandNotification(CommandNotification.ADD_SHEET_FRAMES,_loc7_));
      }
      
      private function _13284(param1:Event) : void
      {
         this._13307._13311 = this._13306._13289.selected;
         _951._13330 = this._13306._13289.selected;
         _1567(new TimelineNotification(TimelineNotification.UPDATE_STAGE_VIEW));
      }
      
      private function _4711(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this._13307 && this._13306 && Boolean(this._13306._13300))
         {
            this._13307._13327 = this._13306._13300.selected;
            this._13307._13319 = this._13306._13293.selected;
            _loc2_ = this._13306._13300.selected || this._13306._13293.selected;
            _loc3_ = this._13306._13300.selected ? 1 : 0;
            _loc4_ = this._13306._13293.selected ? 1 : 0;
            _loc5_ = this._13307._13290();
            _loc6_ = int(this._13307._13225.length - 1);
            this._3443.open = _loc2_;
            this._3443._4698 = _loc5_;
            this._3443._4642 = _loc6_;
            this._3443._4738(_loc3_,true);
            this._3443._4738(_loc4_,false);
            this._3443.draw();
         }
      }
      
      private function _13298(param1:MouseEvent) : void
      {
         this._13312(null);
      }
      
      private function _13328(param1:MouseEvent) : void
      {
         var _loc2_:Object = {};
         _loc2_._13256 = this._13307._13331._1715.concat();
         _loc2_._13255 = this._13307._13332();
         _loc2_._1837 = this._13307._13331;
         _1567(new CommandNotification(CommandNotification.RESET_SHEET_ORDER,_loc2_));
      }
      
      private function _13310(param1:MouseEvent) : void
      {
         var _loc2_:Object = {};
         _loc2_._13256 = this._13307._13331._1715.concat();
         _loc2_._13255 = this._13307._13326();
         _loc2_._1837 = this._13307._13331;
         _1567(new CommandNotification(CommandNotification.RESET_SHEET_ORDER,_loc2_));
      }
      
      private function _13303(param1:Event) : void
      {
         this._13307.loop = this._13306._13323.selected;
         if(this._13307.loop)
         {
            this._13307._13253 = 0;
            if(this._13307._1886)
            {
               this._13307._1886.playTimes = 0;
            }
         }
         else
         {
            this._13307._13253 = 1;
            if(this._13307._1886)
            {
               this._13307._1886.playTimes = 1;
            }
         }
         this._13250();
      }
      
      private function _4736(param1:MouseEvent) : void
      {
         ++this._6995;
         this._13329(this._6995);
      }
      
      private function _4735(param1:MouseEvent) : void
      {
         --this._6995;
         if(this._6995 < 0)
         {
            this._6995 = this._13307._13225.length - 1;
         }
         if(this._6995 < 0)
         {
            this._6995 = 0;
         }
         this._13329(this._6995);
      }
      
      private function _13304(param1:MouseEvent) : void
      {
         this._6995 = 0;
         this._13329(this._6995);
      }
      
      private function _13316(param1:MouseEvent) : void
      {
         this._6995 = this._13307._13225.length - 1;
         if(this._6995 < 0)
         {
            this._6995 = 0;
         }
         this._13329(this._6995);
      }
      
      private function _13315(param1:FocusEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:int = this._13307.frameRate;
         var _loc3_:int = int(this._13306._6502.text);
         if(_loc3_ > 60)
         {
            _loc3_ = 60;
         }
         this._13306._6502.text = _loc3_.toString();
         if(_loc2_ != _loc3_)
         {
            (_loc4_ = {})._1886 = this._13307._1886;
            _loc4_._2948 = _loc2_;
            _loc4_._2947 = _loc3_;
            _1567(new CommandNotification(CommandNotification.MODIFY_SHEET_FPS,_loc4_));
         }
      }
      
      public function _13247() : void
      {
         this._13306._6502.text = this._13307.frameRate.toString();
         this._13296 = 1000 / this._13307.frameRate;
      }
      
      public function _13250() : void
      {
         this._13306._13317.text = this._13307._13253.toString();
         this._13306._13317.enabled = this._13307._13253 > 0;
      }
      
      public function _13243() : void
      {
         if(this._13307 == null || this._13306 == null)
         {
            return;
         }
         this._6995 = this._13307._13290();
         var _loc1_:int = this._13307._13290() + 1;
         if(this._13307._13225.length == 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:String = tr("Sheet.frame.show",_loc1_,this._13307._13225.length);
         this._13306._4730.text = _loc2_;
         _1567(new TipNotification(TipNotification.SHOW_TOOL_TIP,{
            "type":_717.DEFAULT,
            "showText":_loc2_
         }));
      }
      
      private function _3988(param1:FocusEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:int = this._13307._13253;
         var _loc3_:int = int(this._13306._13317.text);
         if(_loc3_ == 0)
         {
            _loc3_ = 1;
            this._13306._13317.text = _loc3_.toString();
         }
         if(_loc2_ != _loc3_)
         {
            (_loc4_ = {}).sheetModel = this._13307;
            _loc4_._1886 = this._13307._1886;
            _loc4_._13251 = _loc3_;
            _loc4_._13252 = _loc2_;
            _1567(new CommandNotification(CommandNotification.MODIFY_SHEET_PLAY_TIME,_loc4_));
         }
      }
      
      private function _2838() : void
      {
         if(Boolean(this._13307) && Boolean(this._13306))
         {
            this._13306._6502.text = this._13307.frameRate.toString();
            this._13306._13317.text = this._13307._13253.toString();
            this._13306._13323.selected = this._13307.loop;
            this._13306._13289.selected = this._13307._13311;
            this._13306._13300.selected = this._13307._13327;
            this._13306._13293.selected = this._13307._13319;
            this._13284(null);
            this._13250();
            _99(function():void
            {
               _4711(null);
            });
            this._13243();
         }
      }
      
      private function _13314(param1:Event) : void
      {
         if(this._13306)
         {
            if(this._13307 == null || this._13307._13225.length <= 1)
            {
               this._13306._4758.selected = false;
               return;
            }
            if(this._13306._4758.selected)
            {
               _1567(new SheetNotification(SheetNotification.PLAY));
            }
            else
            {
               _1567(new SheetNotification(SheetNotification.STOP_PLAY));
            }
         }
      }
      
      private function _13321(param1:SheetNotification) : void
      {
         this._6919 = false;
         this._13320.stop();
         this._13320.reset();
         if(Boolean(this._13306) && Boolean(this._13306._4758))
         {
            this._13306._4758.selected = false;
            this._13306._6502.enabled = true;
            this._13306._4730.enabled = true;
            if(Boolean(this._13307) && !this._13307.loop)
            {
               this._13306._13317.enabled = true;
            }
            this._13306._4197.enabled = true;
            this._13306._13302.enabled = true;
            this._13306._13318.enabled = true;
            this._13322.enabled = true;
         }
      }
      
      private function _4762(param1:SheetNotification) : void
      {
         if(this._13307 == null || this._13307._13225.length <= 1)
         {
            return;
         }
         this._6919 = true;
         this._lastTime = getTimer();
         this._5099 = this._lastTime;
         this._13325 = 0;
         this._6995 = this._13322._5358[0];
         this._13305 = 0;
         this._13296 = 1000 / this._13307.frameRate;
         this._13320.start();
         if(Boolean(this._13306) && Boolean(this._13306._4758))
         {
            this._13306._4758.selected = true;
            this._13306._6502.enabled = false;
            this._13306._4730.enabled = false;
            this._13306._13317.enabled = false;
            this._13306._4197.enabled = false;
            this._13306._13302.enabled = false;
            this._13306._13318.enabled = false;
            this._13322.enabled = false;
         }
      }
      
      private function _13329(param1:int) : void
      {
         var _loc2_:_70 = this._13307._13282(param1);
         this._13292(_loc2_);
      }
      
      private function _13333(param1:DragEvent) : void
      {
         var _loc2_:_70 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         if(param1._1611)
         {
            _loc2_ = param1._1611._4508("targetDisplayVO") as _70;
            _loc3_ = int(param1._1611._4508("oldIndex"));
            _loc4_ = int(param1._1611._4508("newIndex"));
            _loc5_ = this._13307._13331._1715.concat();
            _loc6_ = this._13307._13331._1715[_loc3_];
            _loc5_.splice(_loc3_,1);
            _loc5_.splice(_loc4_,0,_loc6_);
            (_loc7_ = {})._13256 = this._13307._13331._1715.concat();
            _loc7_._13255 = _loc5_;
            _loc7_._1837 = this._13307._13331;
            _1567(new CommandNotification(CommandNotification.RESET_SHEET_ORDER,_loc7_));
         }
      }
      
      private function _13291(param1:SheetNotification) : void
      {
         var _loc2_:_70 = param1.data as _70;
         this._13292(_loc2_);
      }
      
      private function _13292(param1:_70) : void
      {
         if(param1)
         {
            if(this._13322)
            {
               this._13322._2484 = param1;
               this._13322._2449(true);
               this._13322._8098(this._13322.selectedIndex);
            }
            this._13307._13292(param1);
            _1567(new SheetNotification(SheetNotification.CUR_FRAAME_CHANGE,param1));
            this._2212._2907(this._13307._13331);
         }
         if(this._13306)
         {
            this._13243();
         }
         this._13248();
      }
      
      private function _13313(param1:Event) : void
      {
         var _loc2_:_70 = null;
         if(this._13322._2889.length > 0)
         {
            _loc2_ = this._13322._2889[0] as _70;
            _1567(new SheetNotification(SheetNotification.SELECT_FRAME,_loc2_));
         }
      }
      
      public function selectAll() : void
      {
         var _loc1_:Vector.<int> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this._13322)
         {
            _loc1_ = new Vector.<int>();
            _loc3_ = int(this._13307._13225.length);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc1_.push(_loc2_);
               _loc2_++;
            }
            this._13322._5358 = _loc1_;
         }
      }
      
      private function _13294(param1:SheetEvent) : void
      {
         var _loc2_:_70 = param1.data;
         this._13312(_loc2_);
      }
      
      private function _13312(param1:_70) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Vector.<Object> = this._13322._2889;
         var _loc3_:Array = [];
         var _loc4_:_70 = param1;
         if((Boolean(_loc4_)) && _loc2_.indexOf(_loc4_) == -1)
         {
            _loc3_.push(_loc4_);
         }
         else
         {
            _loc6_ = 0;
            _loc7_ = int(_loc2_.length);
            while(_loc6_ < _loc7_)
            {
               if(_loc2_[_loc6_] is _70)
               {
                  _loc3_.push(_loc2_[_loc6_]);
               }
               _loc6_++;
            }
         }
         var _loc5_:Object;
         (_loc5_ = {})._1837 = this._13307._13331;
         _loc5_._1839 = this._13307._1886._1755;
         _loc5_._13229 = _loc3_;
         _loc5_.origin = this._13307._13331._1715.concat();
         _loc5_._1886 = this._13307._1886;
         _loc5_._13245 = this._13307._13301;
         if(_loc3_.indexOf(this._13307._13301) != -1)
         {
            _loc6_ = 0;
            _loc7_ = int(this._13307._13225.length);
            while(_loc6_ < _loc7_)
            {
               if(_loc3_.indexOf(this._13307._13225[_loc6_]) == -1)
               {
                  _loc5_._13246 = this._13307._13225[_loc6_];
               }
               _loc6_++;
            }
         }
         else
         {
            _loc5_._13246 = this._13307._13301;
         }
         _1567(new CommandNotification(CommandNotification.DEL_SHEET_FRAMES,_loc5_));
      }
      
      private function _10781(param1:StageNotification) : void
      {
         if(_2220._2873 == _715.SHEET)
         {
            this.open();
         }
         else
         {
            this.close();
         }
      }
      
      public function set _2871(param1:_665) : void
      {
         this.close();
         if(Boolean(_3028) && _3028._1811 == SymbolType.SHEET)
         {
            this.open();
         }
      }
      
      public function open() : void
      {
         if(this._6620)
         {
            return;
         }
         this._6620 = true;
         this._4906();
         _1567(new SheetNotification(SheetNotification.CUR_FRAAME_CHANGE));
      }
      
      public function close() : void
      {
         if(this._6620)
         {
            if(this._6919)
            {
               _1567(new SheetNotification(SheetNotification.STOP_PLAY));
            }
            this._3443.open = false;
            this._3443.draw();
            this._13307._13319 = false;
            this._13307._13327 = false;
            this._6620 = false;
            this._10527();
            if(_2226._2889)
            {
               _2226._2889.length = 0;
            }
            _951._13330 = false;
            this._13307 = null;
            this._13286 = null;
            this._13322.dataProvider = null;
            this._13322._2449();
         }
      }
      
      private function _4906() : void
      {
         if(Boolean(this._13306) && Boolean(this._13306._13324))
         {
            this._13322 = this._13306._13324;
            this._13307 = this._13299(_3028);
            if(this._13307 == null)
            {
               return;
            }
            this._13286 = new _1037(this._13307._13225);
            this._13322.dataProvider = this._13286;
            setTimeout(function():void
            {
               if(Boolean(_13322) && Boolean(_13307))
               {
                  _13322._2484 = _13307._13301;
                  _13322._2449(true);
                  _13322._8098(_13322.selectedIndex);
               }
            },1);
            this._5476();
            this._2838();
         }
      }
      
      private function _13299(param1:_50) : _13209
      {
         var _loc2_:_13209 = null;
         if(Boolean(param1) && param1._1811 == SymbolType.SHEET)
         {
            if(_13295[param1] is _13209)
            {
               return _13295[param1] as _13209;
            }
            _loc2_ = new _13209(param1);
            _13295[param1] = _loc2_;
            return _loc2_;
         }
         return null;
      }
      
      public function refresh() : void
      {
         this._13307._5823();
         this._13286.refresh();
         this._13288(this._13307._13301);
         this._13322._2449();
         this._13248();
         this._13322._8098(this._13322.selectedIndex);
      }
      
      public function _13288(param1:_70) : void
      {
         if(this._13322._2889.indexOf(param1) == -1)
         {
            this._13322._2484 = param1;
         }
      }
      
      public function _13248() : void
      {
         if(this._3443.open)
         {
            this._3443._4698 = this._13307._13290();
            this._3443._4642 = this._13307._13225.length - 1;
            this._3443.draw();
         }
      }
      
      protected function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
      
      protected function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      private function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      private function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
   }
}

