/// DOM定義
/// SeeAlso:    http://www.w3.org/TR/dom/
module dom;

import std.exception;

mixin template ReadOnly(T, alias Name) {
    public @property mixin(T.stringof ~ ' ' ~ Name ~ "() { return _" ~ Name ~ "; }");
    private @property mixin("void " ~ Name ~ "(" ~ T.stringof ~ " value) { _" ~ Name ~ " = value; }");
    private mixin(T.stringof ~ " _" ~ Name ~ ';');
}

class DOMException : Exception{
    enum DOMException : ushort {
        INDEX_SIZE_ERR = 1,
        DOMSTRING_SIZE_ERR = 2, // historical
        HIERARCHY_REQUEST_ERR = 3,
        WRONG_DOCUMENT_ERR = 4,
        INVALID_CHARACTER_ERR = 5,
        NO_DATA_ALLOWED_ERR = 6, // historical
        NO_MODIFICATION_ALLOWED_ERR = 7,
        NOT_FOUND_ERR = 8,
        NOT_SUPPORTED_ERR = 9,
        INUSE_ATTRIBUTE_ERR = 10, // historical
        INVALID_STATE_ERR = 11,
        SYNTAX_ERR = 12,
        INVALID_MODIFICATION_ERR = 13,
        NAMESPACE_ERR = 14,
        INVALID_ACCESS_ERR = 15,
        VALIDATION_ERR = 16, // historical
        TYPE_MISMATCH_ERR = 17, // historical, use JavaScript's TypeError instead
        SECURITY_ERR = 18,
        NETWORK_ERR = 19,
        ABORT_ERR = 20,
        URL_MISMATCH_ERR = 21,
        QUOTA_EXCEEDED_ERR = 22,
        TIMEOUT_ERR = 23,
        INVALID_NODE_TYPE_ERR = 24,
        DATA_CLONE_ERR = 25,
    };
    alias DOMException this;

    DOMException code;

    this(DOMException code, string file = __FILE__, size_t line = __LINE__) {
        import std.conv;
        super(code.to!string(), file, line);
    }
}

class Event {
    this(string type, EventInit eventInit) {
        bubbles = eventInit.bubbles;
        cancelable = eventInit.cancelable;
        this(type);
    }
    this(string type) {
        type = type;
    }

    mixin ReadOnly!(string, "type");
    mixin ReadOnly!(EventTarget, "target");
    mixin ReadOnly!(EventTarget, "currenttarget");

    mixin ReadOnly!(EventPhase, "eventPhase");

    void stopPropagation() {
        assert(0);
    }
    void stopImmediatePropagation() {
        assert(0);
    }

    mixin ReadOnly!(bool, "bubbles");
    mixin ReadOnly!(bool, "cancelable");

    void preventDefault() {
        assert(0);
    }
    mixin ReadOnly!(bool, "defaultPrevented");

    import std.datetime;
    mixin ReadOnly!(bool, "isTrusted");
    mixin ReadOnly!(DateTime, "timeStamp");

    void initEvent(string type, bool bubbles, bool cancelable) {
        assert(0);
    }
}

class EventInit {
    bool bubbles = false;
    bool cancelable = false;

    this(bool bubbles = false, bool cancelable = false) {
        this.bubbles = bubbles;
        this.cancelable = cancelable;
    }
}

enum EventPhase : short {
    NONE = 0,
    CAPTURING_PHASE = 1,
    AT_TARGET = 2,
    BUBBLING_PHASE = 3,
}

class EventTarget {
    void addEventListener(string type, EventListener callback, bool capture = false) {
        assert(0);
    }
    void removeEventListener(string type, EventListener callback, bool capture = false) {
        assert(0);
    }
    bool dispatchEvent(Event event) {
        assert(0);
    }
}

class EventListener {
    void handleEvent(Event event);
}

interface NonElementParentNode {
    Element getElementById(string elementId);
}

interface ParentNode {
    @property HTMLCollectioon children();
    @property Element firstElementChild();
    @property Element lastElementChild();
    @property size_t childElementCount(); // ulong?

    Element querySelector(string selectors);
    NodeList querySelectorAll(string selectors);
}

interface NonDocumentTypeChildNode {
    @property Element previousElementSibling();
    @property Element nextElementSibling();
}

interface ChildNode {
    void remove();
}

class NodeList {
    Node item(size_t index) {
        assert(0);
    }
    mixin ReadOnly!(size_t, "length");
}

class HTMLCollectioon {
    Element item(size_t index) {
        assert(0);
    }
    Element namedItem(string name) {
        assert(0);
    }
    mixin ReadOnly!(size_t, "length");
}

class MutationObserver {
    this(MutationCallback callback) {
        assert(0);
    }
    void observer(Node target, MutationObserverInit options) {
        assert(0);
    }
    void disconnect() {
        assert(0);
    }

    // sequence<MutationRecord>?
    MutationRecord[] takeRecords() {
        assert(0);
    }
}
// sequence<MutationRecord>?
alias MutationCallback = void delegate(MutationRecord[] mutations, MutationObserver observer);

struct MutationObserverInit {
    bool childList = false;
    bool attributes;
    bool characterData;
    bool subtree = false;
    bool attributeOldValue;
    bool characterDataOldValue;
    // sequence<DOMString>?
    string[] attributeFilter;
}

// struct OK?
struct MutationRecord {
    mixin ReadOnly!(string, "type");
    mixin ReadOnly!(Node, "target");
    mixin ReadOnly!(NodeList, "addedNodes");
    mixin ReadOnly!(NodeList, "removedNodes");
    mixin ReadOnly!(Node, "previousSibling");
    mixin ReadOnly!(Node, "nextSibling");
    mixin ReadOnly!(string, "attributeName");
    mixin ReadOnly!(string, "attributeNamespace");
    mixin ReadOnly!(string, "oldValue");
}

class Node : EventTarget {
    mixin ReadOnly!(NodeType, "nodeType");
    mixin ReadOnly!(string, "nodeName");

    mixin ReadOnly!(string, "baseURI");

    mixin ReadOnly!(Document, "ownerDocument");
    mixin ReadOnly!(Node, "parentNode");
    mixin ReadOnly!(Element, "parentElement");
    bool hasChildNodes() {
        assert(0);
    }
    mixin ReadOnly!(NodeList, "childNodes");
    mixin ReadOnly!(Node, "firstChild");
    mixin ReadOnly!(Node, "lastChild");
    mixin ReadOnly!(Node, "previousSibling");
    mixin ReadOnly!(Node, "nextSibling");

    string nodeValue;
    string textContent;

    void normalize() {
        assert(0);
    }

    Node cloneNode(bool deep = false) {
        assert(0);
    }
    bool isEqualNode(Node node) {
        assert(0);
    }

    DocumentPosition compareDocumentPosition(Node other) {
        assert(0);
    }
    bool contains(Node other) {
        assert(0);
    }

    string lookupPrefix(string namespace) {
        assert(0);
    }
    string lookupNamespaceURI(string prefix) {
        assert(0);
    }
    bool isDefaultNamespace(string namespace) {
        assert(0);
    }

    Node insertBefore(Node node, Node child) {
        assert(0);
    }
    Node appendChild(Node node) {
        assert(0);
    }
    Node replacerChild(Node node, Node child) {
        assert(0);
    }
    Node removeChild(Node child) {
        assert(0);
    }
}

enum NodeType : ushort {
    ELEMENT_NODE = 1,
    ATTRIBUTE_NODE = 2, // historical
    TEXT_NODE = 3,
    CDATA_SECTION_NODE = 4, // historical
    ENTITY_REFERENCE_NODE = 5, // historical
    ENTITY_NODE = 6, // historical
    PROCESSING_INSTRUCTION_NODE = 7,
    COMMENT_NODE = 8,
    DOCUMENT_NODE = 9,
    DOCUMENT_TYPE_NODE = 10,
    DOCUMENT_FRAGMENT_NODE = 11,
    NOTATION_NODE = 12, // historical
}

enum DocumentPosition : ushort {
    DOCUMENT_POSITION_DISCONNECTED = 0x01,
    DOCUMENT_POSITION_PRECEDING = 0x02,
    DOCUMENT_POSITION_FOLLOWING = 0x04,
    DOCUMENT_POSITION_CONTAINS = 0x08,
    DOCUMENT_POSITION_CONTAINED_BY = 0x10,
    DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC = 0x20,
}

class Document : Node, NonElementParentNode, ParentNode, NonDocumentTypeChildNode {
    mixin ReadOnly!(DOMImplementation, "implementation");
    mixin ReadOnly!(string, "URL");
    mixin ReadOnly!(string, "documentURI");
    mixin ReadOnly!(string, "compatMode");
    mixin ReadOnly!(string, "characterSet");
    mixin ReadOnly!(string, "contentType");

    mixin ReadOnly!(DocumentType, "doctype");
    mixin ReadOnly!(Element, "documentElement");
    HTMLCollectioon getElementsByTagName(string localName) {
        assert(0);
    }
    HTMLCollectioon getElementsByTagNameNS(string namespace, string localName) {
        assert(0);
    }
    HTMLCollectioon getElementsByClassName(string className) {
        assert(0);
    }

    Element createElement(string localName) {
        assert(0);
    }
    Element createElementNS(string namespace, string localName) {
        assert(0);
    }
    DocumentFragment createDocumentFragment() {
        assert(0);
    }
    Text createTextNode(string data) {
        assert(0);
    }
    Comment createComment(string data) {
        assert(0);
    }
    ProcessingInstruction coreateProcessingInstruction(string target, string data) {
        assert(0);
    }

    Node importNode(Node node, bool deep = false) {
        assert(0);
    }
    Node adoptNode(Node node) {
        assert(0);
    }

    Event createEvent(string interface_) {
        assert(0);
    }
    Range createRange() {
        assert(0);
    }

    // unsigned long -> uint ?
    NodeIterator createNodeIterator(Node root, uint whatToShow = 0xFFFFFFFF, NodeFilter filter = NodeFilter()) {
        assert(0);
    }
    // unsigned long -> uint ?
    TreeWalker createTreeWalker(Node root, uint whatToShow = 0xFFFFFFFF, NodeFilter filter = NodeFilter()) {
        assert(0);
    }

    // NonElementParentNode
    override Element getElementById(string elementId) {
        assert(0);
    }

    // ParentNode
    @property HTMLCollectioon children() {
        assert(0);
    }
    @property Element firstElementChild() {
        assert(0);
    }
    @property Element lastElementChild() {
        assert(0);
    }
    @property size_t childElementCount() {
        assert(0);
    }

    Element querySelector(string selectors) {
        assert(0);
    }
    NodeList querySelectorAll(string selectors) {
        assert(0);
    }

    // NonDocumentTypeChildNode
    @property Element previousElementSibling() {
        assert(0);
    }
    @property Element nextElementSibling() {
        assert(0);
    }
}

class XMLDocument : Document {
}

class DOMImplementation {
    DocumentType createDocumentType(string qualifiedName, string publicId, string systemId) {
        assert(0);
    }
    XMLDocument createDocument(string namespace, string qualifiedName, DocumentType doctype = null) {
        assert(0);
    }
    Document createHTMLDocument(string title) {
        assert(0);
    }

    bool hasFeature() {
        return true;
    }
}

class DocumentFragment : Node, NonElementParentNode, ParentNode {
    // NonElementParentNode
    override Element getElementById(string elementId) {
        assert(0);
    }

    // ParentNode
    @property HTMLCollectioon children() {
        assert(0);
    }
    @property Element firstElementChild() {
        assert(0);
    }
    @property Element lastElementChild() {
        assert(0);
    }
    @property size_t childElementCount() {
        assert(0);
    }

    Element querySelector(string selectors) {
        assert(0);
    }
    NodeList querySelectorAll(string selectors) {
        assert(0);
    }
}

class DocumentType : Node, ChildNode {
    mixin ReadOnly!(string, "name");
    mixin ReadOnly!(string, "publicId");
    mixin ReadOnly!(string, "systemId");

    // ChildNode
    void remove() {
        assert(0);
    }
}

class Element : Node, ParentNode, ChildNode {
    mixin ReadOnly!(string, "namespaceURI");
    mixin ReadOnly!(string, "prefix");
    mixin ReadOnly!(string, "localName");
    mixin ReadOnly!(string, "tagName");

    string id;
    string className;
    mixin ReadOnly!(DOMTokenList, "classList");

    mixin ReadOnly!(Attr[], "attributes");
    string getAttribute(string name) {
        assert(0);
    }
    string getAttributeNS(string namespace, string localName) {
        assert(0);
    }
    void setAttribute(string name, string value) {
        assert(0);
    }
    void setAttributeNS(string namespace, string localName, string value) {
        assert(0);
    }
    void removeAttribute(string name) {
        assert(0);
    }
    void removeAttributeNS(string namespace, string localName) {
        assert(0);
    }
    bool hasAttribute(string name) {
        assert(0);
    }
    bool hasAttributeNS(string namespace, string localName) {
        assert(0);
    }

    bool matches(string selectors) {
        assert(0);
    }

    HTMLCollectioon getElementsByTagName(string localName) {
        assert(0);
    }
    HTMLCollectioon getElementsByTagNameNS(string namespace, string localName) {
        assert(0);
    }
    HTMLCollectioon getElementsByClassName(string className) {
        assert(0);
    }

    // ParentNode
    @property HTMLCollectioon children() {
        assert(0);
    }
    @property Element firstElementChild() {
        assert(0);
    }
    @property Element lastElementChild() {
        assert(0);
    }
    @property size_t childElementCount() {
        assert(0);
    }

    Element querySelector(string selectors) {
        assert(0);
    }
    NodeList querySelectorAll(string selectors) {
        assert(0);
    }

    // ChildNode
    void remove() {
        assert(0);
    }
}

// struct OK?
struct Attr {
    mixin ReadOnly!(string, "localName");
    string value;

    mixin ReadOnly!(string, "name");
    mixin ReadOnly!(string, "namespaceURI");
    mixin ReadOnly!(string, "prefix");

    @property bool specified() {
        return true;
    }
}

class CharacterData : Node, NonDocumentTypeChildNode, ChildNode {
    string data;
    @property size_t length() const {
        return data.length;
    }
    string substringData(size_t offset, size_t count) {
        assert(0);
    }
    void appendData(string data) {
        assert(0);
    }
    void inertData(size_t offset, string data) {
        assert(0);
    }
    void deleteData(size_t offset, size_t count) {
        assert(0);
    }
    void replaceData(size_t offset, size_t count, string data) {
        assert(0);
    }

    // NonDocumentTypeChildNode
    @property Element previousElementSibling() {
        assert(0);
    }
    @property Element nextElementSibling() {
        assert(0);
    }

    // ChildNode
    void remove() {
        assert(0);
    }
}

class Text : CharacterData {
    Text splitText(size_t offset) {
        assert(0);
    }
    mixin ReadOnly!(string, "wholeText");
}

class ProcessingInstruction : CharacterData {
    mixin ReadOnly!(string, "target");
}

class Comment : CharacterData {
}

class Range {
    mixin ReadOnly!(Node, "startContainer");
    mixin ReadOnly!(size_t, "startOffset");
    mixin ReadOnly!(Node, "endContainer");
    mixin ReadOnly!(size_t, "endContainer");
    mixin ReadOnly!(bool, "collapsed");
    mixin ReadOnly!(Node, "commonAncestorContainer");

    void setStart(Node node, size_t offset) {
        assert(0);
    }
    void setEnd(Node node, size_t offset) {
        assert(0);
    }
    void setStartBefore(Node node) {
        assert(0);
    }
    void setStartAfter(Node node) {
        assert(0);
    }
    void setEndBefore(Node node) {
        assert(0);
    }
    void setEndAfter(Node node) {
        assert(0);
    }
    void collapse(bool toStart = false) {
        assert(0);
    }
    void selectNode(Node node) {
        assert(0);
    }
    void selectNodeContents(Node node) {
        assert(0);
    }

    enum How : ushort {
        START_TO_START = 0,
        START_TO_END = 1,
        END_TO_END = 2,
        END_TO_START = 3,
    }
    short compareBoundaryPoints(How how, Range sourceRange) {
        assert(0);
    }

    void deleteContents() {
        assert(0);
    }
    DocumentFragment extractContents() {
        assert(0);
    }
    DocumentFragment cloneContents() {
        assert(0);
    }
    void insertNode(Node node) {
        assert(0);
    }
    void surroundContents(Node newParent) {
        assert(0);
    }

    Range cloneRange() {
        assert(0);
    }
    void detach() {
        assert(0);
    }

    bool isPointInRange(Node node, size_t offset) {
        assert(0);
    }
    short comparePoint(Node node, size_t offset) {
        assert(0);
    }

    bool intersectsNode(Node node) {
        assert(0);
    }

    // stringifier ?;
    string stringifier() {
        assert(0);
    }
};

class NodeIterator {
    mixin ReadOnly!(Node, "root");
    mixin ReadOnly!(Node, "referenceNode");
    mixin ReadOnly!(bool, "pointerBeforeReferenceNode");
    mixin ReadOnly!(uint, "whatToShow");    // unsigned long -> uint?
    mixin ReadOnly!(NodeFilter, "filter");

    Node nextNode() {
        assert(0);
    }
    Node previousNode() {
        assert(0);
    }

    void detach() {
        assert(0);
    }
}

class TreeWalker {
    mixin ReadOnly!(Node, "root");
    mixin ReadOnly!(uint, "whatToShow");    // unsigned long -> uint?
    mixin ReadOnly!(NodeFilter, "filter");
    Node currentNode;

    Node parentNode() {
        assert(0);
    }
    Node firstChlid() {
        assert(0);
    }
    Node lastChlid() {
        assert(0);
    }
    Node previousSibling() {
        assert(0);
    }
    Node nextSibling() {
        assert(0);
    }
    Node previousNode() {
        assert(0);
    }
    Node nextNode() {
        assert(0);
    }
    Node previousNode() {
        assert(0);
    }

    void detach() {
        assert(0);
    }
}

// ToDo
struct NodeFilter {
    // Constants for acceptNode()
    const ushort FILTER_ACCEPT = 1;
    const ushort FILTER_REJECT = 2;
    const ushort FILTER_SKIP = 3;

    // Constants for whatToShow
    const ulong SHOW_ALL = 0xFFFFFFFF;
    const ulong SHOW_ELEMENT = 0x1;
    const ulong SHOW_ATTRIBUTE = 0x2; // historical
    const ulong SHOW_TEXT = 0x4;
    const ulong SHOW_CDATA_SECTION = 0x8; // historical
    const ulong SHOW_ENTITY_REFERENCE = 0x10; // historical
    const ulong SHOW_ENTITY = 0x20; // historical
    const ulong SHOW_PROCESSING_INSTRUCTION = 0x40;
    const ulong SHOW_COMMENT = 0x80;
    const ulong SHOW_DOCUMENT = 0x100;
    const ulong SHOW_DOCUMENT_TYPE = 0x200;
    const ulong SHOW_DOCUMENT_FRAGMENT = 0x400;
    const ulong SHOW_NOTATION = 0x800; // historical

    ushort acceptNode(Node node) {
        assert(0);
    }
}

class DOMTokenList {
    mixin ReadOnly!(size_t, "lengt");
    string item(size_t index) {
        assert(0);
    }
    void add(T...)(T tokens) {
        assert(0);
    }
    void remove(T...)(T tokens) {
        assert(0);
    }
    bool toggle(string token, bool force = false) {
        assert(0);
    }
    // stringifier?
    string stringifier() {
        assert(0);
    }
}

class DOMSettableTokenList : DOMTokenList {
    string value;
}
