package _1009
{
   import _1021._10495;
   import _1033._10496;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _127._171;
   import _1374.IconButton;
   import _648._650;
   import _822._828;
   import _97._125;
   import egret.utils.FileUtil;
   import egret.utils.tr;
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.desktop.NativeDragActions;
   import flash.desktop.NativeDragManager;
   import flash.display.InteractiveObject;
   import flash.events.MouseEvent;
   import flash.events.NativeDragEvent;
   import flash.filesystem.File;
   import flash.text.TextFormatAlign;
   
   public class SwapImageWindow extends _171
   {
      public var tip1:Label;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var _10529:_10495;
      
      public var _4020:IconButton;
      
      public var _10530:IconButton;
      
      private var _callback:Function;
      
      private var _10528:File;
      
      private var _5146:Array;
      
      public function SwapImageWindow(param1:Function)
      {
         this.tip1 = new Label();
         this._10529 = new _10495();
         this._5146 = ["png","jpg","jpeg"];
         super();
         this.title = tr("SwapImageWindow.title");
         this.width = NaN;
         resizable = false;
         this.minWidth = 490;
         this.minHeight = 290;
         this.width = 490;
         this.height = 290;
         this._callback = param1;
      }
      
      override protected function _2438() : void
      {
         var _loc1_:Group = null;
         var _loc2_:Group = null;
         super._2438();
         this.closeButton.visible = true;
         _loc1_ = _125._2395(10);
         _loc1_.percentWidth = 100;
         _loc2_ = _125._2395();
         _loc2_.percentWidth = 100;
         this._4020 = new IconButton();
         this._4020.icon = "/assets/button/addFile.png";
         this._4020.enabled = false;
         this._10530 = new IconButton();
         this._10530.skinName = _10496;
         this._10530.icon = "/assets/timeline/timeline_zoomIn.png";
         var _loc3_:Group = new Group();
         _loc3_.width = 84;
         _loc3_.height = 84;
         this._4020.percentWidth = 100;
         this._4020.percentHeight = 100;
         this._10529.x = 0;
         this._10529.y = 0;
         this._10529._10514 = 84;
         this._10529._10515 = 84;
         _loc3_.addElement(this._10529);
         _loc3_.addElement(this._4020);
         _loc2_.addElement(_loc3_);
         var _loc4_:Group = _125._2413();
         this.tip1.textAlign = TextFormatAlign.CENTER;
         this.tip1.leading = 10;
         this.tip1.text = tr("SwapImageWindow.tip");
         this.tip1.percentWidth = 100;
         _loc4_.addElement(this.tip1);
         var _loc5_:_828;
         (_loc5_ = new _828()).color = 1777701;
         _loc5_.percentWidth = 100;
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(_loc4_);
         _2512.addElement(_loc1_);
         _2512.percentWidth = 100;
         _2512.percentHeight = 100;
         var _loc6_:Group;
         (_loc6_ = new Group()).percentWidth = 100;
         this._5554 = _125._2399();
         this._5554.label = tr("Alert.Confirm");
         this._5555 = _125._2406();
         this._10530.width = this._5554.width;
         this._10530.height = this._5554.height;
         this._10530.left = 16;
         this._5555.right = 16;
         this._5554.right = 116;
         _loc6_.addElement(this._10530);
         _loc6_.addElement(this._5554);
         _loc6_.addElement(this._5555);
         _loc6_.bottom = 10;
         _2632.bottom = 10;
         _2632.right = 20;
         _loc5_.bottom = 48;
         this.addElement(_loc5_);
         this.addElement(_loc6_);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
         this._10530.addEventListener(MouseEvent.CLICK,this._10531);
         this.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER,this.onDragIn);
         this.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP,this.onDragIn);
         this.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT,this.onDragIn);
         this._10521();
      }
      
      private function onDragIn(param1:NativeDragEvent) : void
      {
         var _loc2_:Clipboard = null;
         var _loc4_:File = null;
         var _loc5_:Object = null;
         var _loc6_:int = 0;
         var _loc7_:File = null;
         var _loc8_:String = null;
         var _loc3_:InteractiveObject = param1.currentTarget as InteractiveObject;
         switch(param1.type)
         {
            case NativeDragEvent.NATIVE_DRAG_ENTER:
               _loc2_ = param1.clipboard;
               if(_loc2_.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
               {
                  _loc5_ = _loc2_.getData(ClipboardFormats.FILE_LIST_FORMAT);
                  for each(_loc4_ in _loc5_)
                  {
                     _loc6_++;
                     _loc7_ = _loc4_;
                  }
                  if(_loc6_ == 1)
                  {
                     _loc8_ = FileUtil.getExtension(_loc7_.nativePath);
                     _loc8_ = _loc8_.toLowerCase();
                     if(this._5146.indexOf(_loc8_) != -1)
                     {
                        NativeDragManager.acceptDragDrop(_loc3_);
                        NativeDragManager.dropAction = NativeDragActions.MOVE;
                     }
                  }
               }
               break;
            case NativeDragEvent.NATIVE_DRAG_DROP:
               _loc2_ = param1.clipboard;
               if(_loc2_.hasFormat(ClipboardFormats.FILE_LIST_FORMAT))
               {
                  _loc5_ = _loc2_.getData(ClipboardFormats.FILE_LIST_FORMAT);
                  for each(_loc4_ in _loc5_)
                  {
                     _loc6_++;
                  }
                  if(_loc6_ == 1)
                  {
                     this.addFile(_loc4_);
                  }
               }
         }
      }
      
      private function _10531(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         try
         {
            FileUtil.browseForOpen(this.addFile,1,_650._4169,tr("BasePage.SelectProjectPath"));
         }
         catch(e:Error)
         {
         }
      }
      
      private function addFile(param1:File) : void
      {
         this._10528 = param1;
         this._10529.setData(param1);
         this._4020.alpha = 0;
         this._10521();
      }
      
      private function _10521() : void
      {
         this._5554.enabled = this._10528 != null;
      }
      
      private function _10527() : void
      {
         this._5554.removeEventListener(MouseEvent.CLICK,this._7060);
         this._4020.removeEventListener(MouseEvent.CLICK,this._10531);
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         if(this._callback != null && this._10528 != null)
         {
            this._callback(this._10528);
         }
         this.close();
      }
      
      override public function close() : void
      {
         this._10527();
         super.close();
      }
   }
}

