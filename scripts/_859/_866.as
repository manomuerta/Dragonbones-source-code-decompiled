package _859
{
   import _1045.Group;
   import _127._165;
   import _1374.IconButton;
   import _636.LibraryEvent;
   import _692._13549;
   import _692._691;
   import _692._693;
   import _692._694;
   import _724._14085;
   import _724._14086;
   import _724._14087;
   import _724._726;
   import _724._727;
   import _724._732;
   import _724._737;
   import _724._738;
   import _73.SymbolType;
   import _870._869;
   import flash.events.MouseEvent;
   
   public class _866 extends _165
   {
      public static const DIR_OPEN:String = "/assets/panelIcon/folderOpen.png";
      
      public static const DIR_CLOSE:String = "/assets/panelIcon/folderClose.png";
      
      public static const TEXTURE_OPEN:String = "/assets/panelIcon/spritesheet.png";
      
      public static const TEXTURE_CLOSE:String = "/assets/panelIcon/spritesheet.png";
      
      public static const SWF_OPEN:String = "/assets/panelIcon/spritesheet.png";
      
      public static const SWF_CLOSE:String = "/assets/panelIcon/spritesheet.png";
      
      public static const IMAGE:String = "/assets/panelIcon/image.png";
      
      public static const IMAGE_USED:String = "/assets/panelIcon/imageUsed.png";
      
      public static const SUB_TEXTURE:String = "/assets/panelIcon/image.png";
      
      public static const SUB_TEXTURE_USED:String = "/assets/panelIcon/imageUsed.png";
      
      public static const MOVIECLIP:String = "/assets/panelIcon/image.png";
      
      public static const MOVIECLIP_USED:String = "/assets/panelIcon/imageUsed.png";
      
      public static const ARMATURE_ICON:String = "/assets/panelIcon/armature.png";
      
      public static const STAGE_ICON:String = "/assets/panelIcon/stage.png";
      
      public static const MOVIECLIP_ICON:String = "/assets/panelIcon/movieclip.png";
      
      public static const SHEET_ICON:String = "/assets/panelIcon/sheet.png";
      
      public static const SVG:String = "/assets/panelIcon/svg.png";
      
      public static const SVG_USED:String = "/assets/panelIcon/svgUsed.png";
      
      public var _6364:IconButton;
      
      public var _6366:IconButton;
      
      public var _4203:IconButton;
      
      public var _2513:Group;
      
      public function _866()
      {
         super();
         skinName = _869;
         _6070 = 10;
         height = 22;
      }
      
      override public function get data() : Object
      {
         return super.data;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:IconButton = null;
         super.partAdded(param1,param2);
         if(param2 == this._6364 || param2 == this._6366 || param2 == this._4203)
         {
            _loc3_ = param2 as IconButton;
            _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this._6363);
            _loc3_.addEventListener(MouseEvent.MOUSE_UP,this._6363);
            _loc3_.addEventListener(MouseEvent.CLICK,this._6363);
            _loc3_.addEventListener(MouseEvent.DOUBLE_CLICK,this._6363);
            if(param2 == this._6364)
            {
               this._6364.addEventListener(MouseEvent.CLICK,this._6365);
            }
            else if(param2 == this._6366)
            {
               this._6366.addEventListener(MouseEvent.CLICK,this._3306);
            }
            else if(param2 == this._4203)
            {
               this._4203.addEventListener(MouseEvent.CLICK,this.onOpen);
            }
         }
      }
      
      private function onOpen(param1:MouseEvent) : void
      {
         dispatchEvent(new LibraryEvent(LibraryEvent.OPEN_IN_BROWSER));
      }
      
      private function _4195(param1:MouseEvent) : void
      {
         dispatchEvent(new LibraryEvent(LibraryEvent.REFRESH));
      }
      
      private function _3306(param1:MouseEvent) : void
      {
         dispatchEvent(new LibraryEvent(LibraryEvent.IMPORT));
      }
      
      private function _6365(param1:MouseEvent) : void
      {
         dispatchEvent(new LibraryEvent(LibraryEvent.CHANGE_PATH));
      }
      
      private function _6363(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._2513.visible = false;
         if(this.data.parent == null)
         {
            _5988 = DIR_OPEN;
            this.mouseEnabled = false;
            this.mouseChildren = false;
         }
         else
         {
            this.mouseEnabled = true;
            this.mouseChildren = true;
         }
         if(this.data is _694)
         {
            if(Boolean((this.data as _694)._4161) && Boolean((this.data as _694)._4161._1886))
            {
               switch((this.data as _694)._4161._1886._1811)
               {
                  case SymbolType.ARMATURE:
                     _5988 = ARMATURE_ICON;
                     break;
                  case SymbolType.MC:
                     _5988 = MOVIECLIP_ICON;
                     break;
                  case SymbolType.STAGE:
                     _5988 = STAGE_ICON;
                     break;
                  case SymbolType.SHEET:
                     _5988 = SHEET_ICON;
               }
            }
            else
            {
               _5988 = ARMATURE_ICON;
            }
         }
         else if(this.data is _13549)
         {
            if(this.opened)
            {
               _5988 = DIR_OPEN;
            }
            else
            {
               _5988 = DIR_CLOSE;
            }
         }
         else if(this.data is _693)
         {
            if(this.data.parent is _694)
            {
               this._2513.visible = true;
            }
            if(this.opened)
            {
               if((this.data as _693)._4204 is _738)
               {
                  _5988 = TEXTURE_OPEN;
               }
               else if((this.data as _693)._4204 is _727 || (this.data as _693)._4204 is _14086)
               {
                  _5988 = SWF_OPEN;
               }
               else
               {
                  _5988 = DIR_OPEN;
               }
            }
            else if((this.data as _693)._4204 is _738)
            {
               _5988 = TEXTURE_CLOSE;
            }
            else if((this.data as _693)._4204 is _727 || (this.data as _693)._4204 is _14086)
            {
               _5988 = SWF_CLOSE;
            }
            else
            {
               _5988 = DIR_CLOSE;
            }
         }
         else if(this.data is _691)
         {
            if((this.data as _691)._4204 is _737)
            {
               if((this.data as _691).count > 0)
               {
                  _5988 = SUB_TEXTURE_USED;
               }
               else
               {
                  _5988 = SUB_TEXTURE;
               }
            }
            else if((this.data as _691)._4204 is _732)
            {
               if((this.data as _691).count > 0)
               {
                  _5988 = IMAGE_USED;
               }
               else
               {
                  _5988 = IMAGE;
               }
            }
            else if((this.data as _691)._4204 is _726 || (this.data as _691)._4204 is _14087)
            {
               if((this.data as _691).count > 0)
               {
                  _5988 = MOVIECLIP_USED;
               }
               else
               {
                  _5988 = MOVIECLIP;
               }
            }
            else if((this.data as _691)._4204 is _14085)
            {
               if((this.data as _691).count > 0)
               {
                  _5988 = SVG_USED;
               }
               else
               {
                  _5988 = SVG;
               }
            }
         }
      }
   }
}

